import 'dart:io';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/services/file_upload_service/file_upload_api_services.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/bottom_sheet_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FileImagePickerWidget extends StatelessWidget {
  RxBool isFileUploading = false.obs;
  String? url;
  double radius;

  FileImagePickerWidget({super.key, this.url, this.radius = 80});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => isFileUploading.value
          ?  LoaderWidget.withCircularIndicator(radius: appDimen.dimen(radius))
          : NetworkImageWidget.withCircular(
              url: url,
              radius: appDimen.dimen(radius),
              onTap: () {
                _onShowOptions(context);
              },
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
    url = await FileUploadApiService().uploadFile(newFile);
    isFileUploading.value = false;
  }
}
