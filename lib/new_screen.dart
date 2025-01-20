import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
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
      Text("New page here")
    ],);
  }
}
