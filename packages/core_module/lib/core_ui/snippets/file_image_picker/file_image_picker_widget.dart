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
  final RxBool _isFileUploading = false.obs;
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

  /// Use this param to build your own request builder to prepare the api that
  /// uploads the file and returns a String as the url.
  /// To use this param, you need not to set the [apiParser] param.
  /// You can make use of the [FileUploadApiService.uploadFile] method;
  /// This is an upload service to upload files to the server.
  /// You need to make sure in your [env.json] file you set the api for uploading files using the key [fileUploadApi].
  /// An example  is below:
  /// ```dart
  /// {
  ///  ... other settings or configurations goes here
  ///
  ///  "fileUploadApi" : "prime.sika/v1/upload-file?"
  ///
  ///  }
  ///  ```
  ///                    OR
  /// You can also explicitly set the api using the [api] parameter in the [uploadFile] method of [FileUploadApiService] method.
  /// Example below:
  /// ```dart
  /// parser : (file) async{
  ///    final upload =  FileUploadApiService().uploadFile<String>(
  ///     file,
  ///     parser: (json) {
  ///       return json['data']["url"] as String;
  ///    },
  ///   );
  ///
  ///  return upload;
  /// },
  /// ```
  final Future<String?> Function(File)? parser;

  /// Use this param to handle the response that comes from your api after file upload to return the url of the file uploaded to the server.
  /// To use this param, you need not to set the [parser] param. You can use this straight away and return the url.
  /// This by default uses the [FileUploadApiService.uploadFile] method to upload the file to the server.
  /// You need to make sure in your [env.json] file you set the api for uploading files using the key [fileUploadApi].
  /// An example  is below:
  /// ```dart
  /// {
  ///  ... other settings or configurations goes here
  ///
  ///  "fileUploadApi" : "prime.sika/v1/upload-file?"
  ///
  ///  }
  ///  ```
  ///                OR
  ///
  /// You can also explicitly set the api using the [api] parameter in the constructor.
  /// ```dart
  /// apiParser : (json) {
  ///       return json['data']["url"] as String;
  ///    },
  ///    ```
  ///
  final String Function(dynamic)? apiParser;

  ///When a file is uploaded to the server and url is returned, use this param [onFileUploaded] to handle the url.
  final Function(String)? onFileUploaded;
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
    assert(!(parser != null && apiParser != null),
    'Both parser and apiParser cannot be present at the same time');

    return Obx(() => _isFileUploading.value
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
    _isFileUploading.value = true;
    File newFile = File(file.path);
    url = parser != null
        ? await parser!(newFile)
        : await FileUploadApiService().uploadFile<String>(
            newFile,
            parser: apiParser,
            api: api,
          );
    _isFileUploading.value = false;
    if (onFileUploaded != null && url != null && url!.isNotEmpty) {
      onFileUploaded!(url ?? '');
    }
  }
}
