import 'package:flutter/material.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';

class BaseScreenStandard extends BaseScreenImpl {
  @override
  bool showAppBar() {
    return false;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return backgroundColor(context);
  }
}
