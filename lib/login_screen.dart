import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:core_module/core_ui/snippets/third_party_auth/third_party_auth_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module_package/res/app_colors.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends BaseScreenWithTabs {


  @override
  String appBarTitle() {
    return "Devotions";
  }

  @override
  void onTap(int index) {
    super.onTap(index);
    debugPrint("on Tap --> $index");
  }

  @override
  void onPageSwiped(int index) {
    super.onPageSwiped(index);
    debugPrint("Tab changed to index: ${tabController.index}");
  }


  @override
  bool showAppBar() {
    return true;
  }

  @override
  int tabCount() {
    return 3;
  }

  @override
  List<Widget> tabs() {
    return [
      Tab(text: "Tab 1"),
      Tab(text: "Tab 2"),
      Tab(text: "Tab 3"),
    ];
  }

  @override
  List<Widget> tabsViews() {
    return [
      Center(child: Text('Content for Tab 1')),
      Center(child: Text('Content for Tab 2')),
      Center(child: Text('Content for Tab 3')),
    ];
  }

}
