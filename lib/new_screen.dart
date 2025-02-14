import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/snippets/file_image_picker/file_image_picker_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module_package/intro_screen.dart';
import 'package:flutter/material.dart';

class NewScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return Colors.green;
  }

  @override
  String appBarTitle() {
    return "New Screen Tested Here";
  }

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            "New page here",
            style: textTheme.labelMedium,
          ),
          ShimmerWidget.withList(length: 5),
          TextButtonWidget.withTextOnly(
            onTap: () {
              navUtils.fireLogOut();
            },
            text: "Intro Scrren",
          ),
          FileImagePickerWidget(),
          CheckboxWidget(onChange: (v){}, text: "Check the Terms and Conditions",),
          TextFieldWidget.withPassword(hintText: 'Enter password',labelText: 'Password',),

        ],
      ),
    );
  }
}
