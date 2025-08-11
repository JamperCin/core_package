import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

abstract class BaseScreenWithTabs extends BaseScreenStatefulStandard {
  late TabController tabController;
  late PageController pageController;
  bool _tabsInitialized = false;

  int initialIndex() {
    return 0;
  }


  List<Widget> tabs();

  List<Widget> tabsViews();

  bool isTabScrollable() {
    return false;
  }

  void onTap(int index) {}

  void onPageSwiped(int index) {}

  Color indicatorColor() {
    return colorScheme.primary;
  }

  Color dividerColor() {
    return colorScheme.surfaceBright;
  }

  Color labelColor() {
    return colorScheme.primary;
  }

  Color unselectedLabelColor() {
    return colorScheme.surfaceDim;
  }

  TextStyle? labelStyle() {
    return textTheme.bodyMedium;
  }

  TextStyle? unselectedLabelStyle() {
    return textTheme.bodyMedium;
  }

  double? dividerHeight() {
    return null;
  }

  double indicatorWeight() {
    return 2.0;
  }

  EdgeInsets? padding() {
    return null;
  }

  EdgeInsets indicatorPadding() {
    return EdgeInsets.zero;
  }

  @override
  bool showAppBar() {
    return true;
  }

  @override
  PreferredSizeWidget? appBarBottomWidget(BuildContext context) {
    // ✅ Prevent crash if tabs are not ready yet
    if (!_tabsInitialized){
     return null;
    }

    return TabBar(
      physics: isTabScrollable() ? null : const NeverScrollableScrollPhysics(),
      controller: tabController,
      onTap: (index) {
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 360),
          curve: Curves.easeInOut,
        );
        onTap(index);
      },
      tabs: tabs(),
      isScrollable: isTabScrollable(),
      indicatorColor: indicatorColor(),
      dividerColor: dividerColor(),
      labelColor: labelColor(),
      labelStyle: labelStyle(),
      unselectedLabelColor: unselectedLabelColor(),
      unselectedLabelStyle: unselectedLabelStyle(),
      padding: padding(),
      dividerHeight: dividerHeight(),
      indicatorPadding: indicatorPadding(),
      indicatorWeight: indicatorWeight(),
    );
  }

  @override
  void initState(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    super.initState(vsync);
    pageController = PageController(initialPage: initialIndex());

    tabController = TabController(
      length: tabs().length,
      vsync: vsync,
      initialIndex: initialIndex(),
    );
    _tabsInitialized = true;
  }


  @override
  void dispose(SingleTickerProviderStateMixin<StatefulWidget> vsync) {
    super.dispose(vsync);
    tabController.dispose();
  }

  @override
  Widget body(BuildContext context) {
    if(!_tabsInitialized){
      return const SizedBox.shrink();
    }

    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        tabController.animateTo(index);
        onPageSwiped(index);
      },
      children: tabsViews(),
    );
  }
}
