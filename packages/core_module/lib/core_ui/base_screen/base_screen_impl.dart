import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/app/app_dimens.dart';
import '../../core/model/local/base_object.dart';
import 'BaseScreen.dart';
import 'base_impl.dart';

abstract class BaseScreenImpl extends BaseScreen implements BaseImpl {
  BaseObject baseObject = BaseObject();
  late BuildContext mContext;

  @override
  BaseObject getModel() {
    return baseObject;
  }

  @override
  void setModel(BaseObject baseObject) {
    this.baseObject = baseObject;
  }

  @override
  TextStyle? appBarTitleStyle(BuildContext context) {
    return textTheme.bodyMedium
        ?.copyWith(color: colorScheme.inverseSurface,fontSize: 20.dp());
  }

  @override
  void setContext(BuildContext context) {
    mContext = context;
    appDimen = AppDimens(context);
  }

  @override
  bool safeArea() {
    return true;
  }

  @override
  Widget? drawer(BuildContext context) {
    return null;
  }

  Color appBarIconColor(BuildContext context) {
    return Theme.of(context).colorScheme.inverseSurface;
  }

  @override
  Widget? appBarLeadingIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(appDimen.dimen(5)),
      child: IconButtonWidget(
        icon: Icons.arrow_back_ios,
        iconSize: appDimen.dimen(20),
        iconColor: appBarIconColor(context),
        padding: EdgeInsets.zero,
        onTap: () {
          Get.back();
        },
      ),
    );
  }

  @override
  double appBarHeight() {
    return appDimen.dimen(60);
  }

  @override
  Widget bottomSheet(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget floatingActionButton(BuildContext context) {
    return const SizedBox();
  }

  @override
  FloatingActionButtonLocation actionButtonLocation() {
    return FloatingActionButtonLocation.endFloat;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.tertiary;
  }

  @override
  Color appBarTitleColor(BuildContext context) {
    return Theme.of(context).colorScheme.tertiary;
  }

  @override
  Widget? appBarTitleWidget(BuildContext context) {
    return null;
  }

  @override
  bool shouldDismissKeyboard() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
    return Container();
  }

  @override
  bool showAppBar() {
    return false;
  }

  @override
  List<Widget> actions() {
    return [];
  }

  @override
  double appBarElevation() {
    return 0;
  }

  @override
  String appBarTitle() {
    return "";
  }

  @override
  IconData icon() {
    return Icons.notification_important_sharp;
  }

  @override
  void dismissKeyBoard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  Color backgroundColor(BuildContext context) {
    return Theme.of(context).colorScheme.surface;
  }

  @override
  Widget bottomNavigationBar(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      elevation: appBarElevation(),
      toolbarHeight: appBarHeight(),
      backgroundColor: appBarBackgroundColor(context),
      leading: appBarLeadingIcon(context),
      surfaceTintColor: appBarBackgroundColor(context),
      title: appBarTitleWidget(context) ??
          Text(
            appBarTitle(),
            style: appBarTitleStyle(context),
          ),
      actions: actions(),
    );
  }
}
