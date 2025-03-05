import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> tabs;
  final Function(int)? onTabOnClick;
  final bool tabBarScrollable;
  final Color? indicatorColor;
  final Color? dividerColor;
  final Color? labelColor;
  final TextStyle? labelStyle;

  const TabBarWidget({
    super.key,
    required this.tabs,
    this.onTabOnClick,
    this.tabBarScrollable = true,
    this.indicatorColor,
    this.dividerColor,
    this.labelColor,
    this.labelStyle,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: widget.tabs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TabBar(
      physics:
          widget.tabBarScrollable ? null : const NeverScrollableScrollPhysics(),
      controller: _tabController,
      onTap: widget.onTabOnClick,
      tabs: widget.tabs,
      indicatorColor: widget.indicatorColor ?? colorScheme.primary,
      dividerColor: widget.dividerColor ?? colorScheme.surface,
      labelColor: widget.labelColor ?? colorScheme.primary,
      labelStyle: widget.labelStyle ?? textTheme.bodyMedium,
      unselectedLabelColor: colorScheme.secondaryFixedDim,
    );
  }
}
