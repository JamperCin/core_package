import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

class ListViewWidget<T> extends StatelessWidget {
  final List<T> items;
  bool withGridView = false;
  final Widget Function(T) parser;
  final Function()? onLoadMore;
  final RefreshCallback? onRefresh;
  final Widget? separator;
  final Widget? loader;
  final bool? primary;
  final bool? shrinkWrap;
  final EdgeInsets? padding;
  final bool? isLoadingMore;
  final ScrollController scrollController = ScrollController();

  ListViewWidget({
    super.key,
    required this.items,
    required this.parser,
    this.padding,
    this.isLoadingMore,
    this.separator,
    this.onLoadMore,
    this.loader,
    this.onRefresh, this.primary, this.shrinkWrap,
  }) {
    _scrollListener();
    withGridView = false;
  }

  ListViewWidget.withGridView({
    super.key,
    required this.items,
    required this.parser,
    this.padding,
    this.isLoadingMore,
    this.separator,
    this.onLoadMore,
    this.loader,
    this.onRefresh, this.primary, this.shrinkWrap,
  }) {
    _scrollListener();
    withGridView = true;
  }

  void _scrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          isLoadingMore == false) {
        onLoadMore?.call();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollController.animateTo(
            scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        });
      }
    });
  }

  Widget _loadingMore(BuildContext context) {
    return (isLoadingMore ?? false)
        ? Column(
            children: [
              Gap(20.dp()),
              loader ??
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LoaderWidget.withIndicator(radius: 20.dp()),
                      Gap(20.dp()),
                      Text(
                        "Loading more ...",
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
              Gap(60.dp()),
            ],
          )
        : const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh ?? () async {},
      child: ListView(
        primary: primary,
        shrinkWrap: shrinkWrap ?? false,
        controller: scrollController,
        padding: padding ??
            EdgeInsets.symmetric(horizontal: 5.dp(), vertical: 10.dp()),
        // itemCount: items.length,
        scrollDirection: Axis.vertical,
        children: withGridView
            ? _withGridView(context)
            : [
                ...items.map((e) => parser(e)),
                _loadingMore(context),
              ],
      ),
    );
  }

  List<Widget> _withGridView(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> column = [];

    final emptyPlaceHolder =
        Flexible(flex: 1, child: SizedBox(width: appDimen.screenWidth));

    for (int i = 0; i < items.length; i++) {
      Widget widget = Flexible(
        flex: 1,
        child: parser(items[i]),
      );
      rows.add(widget);

      if (rows.length == 2) {
        column.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            rows.first,
            Gap(8.dp()),
            rows.last,
          ],
        ));
        column.add(Gap(8.dp()));
        rows = [];
      } else if (i == items.length - 1 && items.length % 2 != 0) {
        column.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [widget, Gap(8.dp()), emptyPlaceHolder],
          ),
        );
        column.add(Gap(8.dp()));
      }
    }

    column.add(Center(child: _loadingMore(context)));

    return column;
  }
}
