import 'package:core_module/core_module.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';

class AppleScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: AssetImageWidget(asset: icApple),
    );
  }

  @override
  String appBarTitle() {
    return "Apple Screen";
  }
}
