import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
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
    return Column(children: [
      Text("New page here", style: textTheme.labelMedium,),
      TextButtonWidget.withTextOnly(onTap: () {
        navUtils.fireLogOut();
      }, text: "Intro Scrren",)
    ],);
  }
}
