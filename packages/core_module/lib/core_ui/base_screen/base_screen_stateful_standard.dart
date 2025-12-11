import 'package:core_module/core_ui/base_screen/base_screen_stateful_impl.dart';
import 'package:flutter/material.dart';

abstract class BaseScreenStatefulStandard extends BaseScreenStatefulImpl {

  @override
  void dispose(SingleTickerProviderStateMixin<StatefulWidget> vsync) {}

  @override
  void initState(SingleTickerProviderStateMixin<StatefulWidget> vsync) {}

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return backgroundColor(context);
  }
}
