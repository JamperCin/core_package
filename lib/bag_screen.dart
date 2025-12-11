import 'package:core_module/core_module.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';

class BagScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: AssetImageWidget(asset: icBag),
    );
  }

  @override
  String appBarTitle() {
    return "Bag Screen";
  }
}
