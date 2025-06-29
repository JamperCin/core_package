import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  final List<Widget> tabs;
  final Function(int)? onTap;
  final bool tabBarScrollable;
  final Color? indicatorColor;
  final Color? dividerColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? labelStyle;
  final TextStyle? unselectedLabelStyle;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? indicatorPadding;
  final double? dividerHeight;
  final double? indicatorWeight;
  final int initialIndex;

  const TabBarWidget({
    super.key,
    required this.tabs,
    this.onTap,
    this.tabBarScrollable = true,
    this.indicatorColor,
    this.dividerColor,
    this.labelColor,
    this.labelStyle,
    this.unselectedLabelColor,
    this.unselectedLabelStyle,
    this.padding,
    this.indicatorPadding,
    this.dividerHeight,
    this.indicatorWeight,
    this.initialIndex = 0,
  });

  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );
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
      onTap: widget.onTap,
      tabs: widget.tabs,
      indicatorColor: widget.indicatorColor ?? colorScheme.primary,
      dividerColor: widget.dividerColor ?? colorScheme.surfaceBright,
      labelColor: widget.labelColor ?? colorScheme.primary,
      labelStyle: widget.labelStyle ?? textTheme.bodyMedium,
      unselectedLabelColor:
          widget.unselectedLabelColor ?? colorScheme.surfaceDim,
      unselectedLabelStyle: widget.unselectedLabelStyle ?? textTheme.bodyMedium,
      padding: widget.padding,
      dividerHeight: widget.dividerHeight,
      indicatorPadding: widget.indicatorPadding ?? EdgeInsets.zero,
      indicatorWeight: widget.indicatorWeight ?? 2.0,
    );
  }
}
