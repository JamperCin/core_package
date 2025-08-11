import 'package:core_module/core_module.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';

class PickUpScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: AssetImageWidget(asset: icPickUp),
    );
  }

  @override
  String appBarTitle() {
    return "PickUp Screen";
  }
}
