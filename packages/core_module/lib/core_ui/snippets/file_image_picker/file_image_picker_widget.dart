import 'dart:io';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/services/file_upload_service/file_upload_api_services.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../widgets/container_widget.dart';

class FileImagePickerWidget extends StatelessWidget {
  RxBool isFileUploading = false.obs;
  String? url;
  String? api;
  String? host;
  String? cameraAsset;
  double? radius;
  double? containerSize;
  double? iconSize;
  double? buttonSize;
  Color? buttonBackgroundColor;
  Color? borderColor;
  Color? iconColor;
  Future<String?> Function(File)? parser;
  String Function(dynamic)? apiParser;
  Function(String)? onFileUploaded;
  final String? placeholder;
  final String? heroTag;
  final BoxFit? fit;
  final Widget? childOnOverlay;
  final Widget? placeHolderWidget;
  final bool setOverlay;

  FileImagePickerWidget({
    super.key,
    this.url,
    this.api,
    this.radius,
    this.cameraAsset,
    this.iconColor,
    this.iconSize,
    this.buttonBackgroundColor,
    this.buttonSize,
    this.borderColor,
    this.parser,
    this.containerSize,
    this.onFileUploaded,
    this.apiParser,
    this.placeholder,
    this.heroTag,
    this.fit,
    this.childOnOverlay,
    this.placeHolderWidget,
    this.setOverlay = false,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => isFileUploading.value
        ? LoaderWidget.withCircularIndicator(radius: radius ?? 60.dp())
        : _imageWidget(context));
  }

  Widget _imageWidget(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: containerSize ?? 120.dp(),
        maxWidth: containerSize ?? 120.dp(),
      ),
      child: Stack(
        children: [
          ContainerWidget.withCircular(
            padding: EdgeInsets.all(1.dp()),
            borderColor: borderColor ?? colorScheme.primary,
            color: Colors.transparent,
            child: NetworkImageWidget.withCircular(
              url: url,
              radius: radius ?? 60.dp(),
              placeholder: placeholder,
              heroTag: heroTag,
              fit: fit,
              placeHolderWidget: placeHolderWidget,
              childOnOverlay: childOnOverlay,
              setOverlay: setOverlay,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: SizedBox(
              height: buttonSize ?? 50.dp(),
              width: buttonSize ?? 50.dp(),
              child: FloatingActionButton(
                shape: const CircleBorder(),
                onPressed: () {
                  _onShowOptions(context);
                },
                backgroundColor: buttonBackgroundColor ?? colorScheme.primary,
                child: Icon(
                  Icons.camera_alt,
                  color: iconColor ?? colorScheme.tertiary,
                  size: iconSize ?? 30.dp(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _optionsWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.orange[300],
              child: Icon(
                Icons.camera_alt,
                size: appDimen.dimen(25),
                color: colorScheme.tertiary,
              ),
              onPressed: () {
                navUtils.fireBack();
                _onOptionSelected(ImageSource.camera);
              },
            ),
            SizedBox(
              height: appDimen.dimen(20),
            ),
            Text(
              "Camera",
              style: textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(width: appDimen.dimen(30)),
        Column(
          children: [
            FloatingActionButton(
              backgroundColor: Colors.indigo[300],
              child: Icon(
                Icons.image,
                size: appDimen.dimen(25),
                color: colorScheme.tertiary,
              ),
              onPressed: () {
                navUtils.fireBack();
                _onOptionSelected(ImageSource.gallery);
              },
            ),
            SizedBox(
              height: appDimen.dimen(10),
            ),
            Text(
              "Photo",
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ],
    );
  }

  void _onShowOptions(BuildContext context) {
    BottomSheetWidget(
      context: context,
      height: appDimen.screenHeight * .2,
      subChild: _optionsWidget(context),
    );
  }

  Future<void> _onOptionSelected(ImageSource src) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: src);
    if (file == null || file.name.isEmpty || file.path.isEmpty) {
      snackBarSnippet.snackBarError("Failed to handle file upload");
      return;
    }

    debugPrint("File == ${file.path}");
    isFileUploading.value = true;
    File newFile = File(file.path);
    url = parser != null
        ? await parser!(newFile)
        : await FileUploadApiService().uploadFile<String>(
            newFile,
            parser: apiParser,
            api: api,
          );
    isFileUploading.value = false;
    if (onFileUploaded != null && url != null && url!.isNotEmpty) {
      onFileUploaded!(url ?? '');
    }
  }
}
