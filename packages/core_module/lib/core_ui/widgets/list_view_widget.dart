import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:flutter/material.dart';

class ListViewWidget<T> extends StatefulWidget {
  final RxList<T> items;
  final Widget Function(T) parser;
  final Future<List<T>> Function()? onLoadMore;
  final Future<List<T>> Function()? onRefresh;
  final Widget? loader;
  final bool? primary;
  final bool? shrinkWrap;
  final EdgeInsets? padding;
  final bool withGridView;

  const ListViewWidget({
    super.key,
    required this.items,
    required this.parser,
    this.onLoadMore,
    this.onRefresh,
    this.loader,
    this.primary,
    this.shrinkWrap,
    this.padding,
    this.withGridView = false,
  });

  const ListViewWidget.withGridView({
    super.key,
    required this.items,
    required this.parser,
    this.onLoadMore,
    this.onRefresh,
    this.loader,
    this.primary,
    this.shrinkWrap,
    this.padding,
  }) : withGridView = true;

  @override
  State<ListViewWidget<T>> createState() => _ListViewWidgetState<T>();
}

class _ListViewWidgetState<T> extends State<ListViewWidget<T>> {
  final ScrollController scrollController = ScrollController();
  final RxBool isLoadingMore = false.obs;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent &&
        (isLoadingMore.value == false)) {
      isLoadingMore.value = true;
      _scrollToLoadingMore();

      final results  = await widget.onLoadMore?.call();
      isLoadingMore.value = false;
      if (results == null || results.isEmpty) return;
      widget.items.value = [...widget.items.value, ...results];
    }
  }

  void _scrollToLoadingMore(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    super.dispose();
  }

  Widget _loadingMore(BuildContext context) {
    return (isLoadingMore.value)
        ? Column(
      children: [
        Gap(20.dp()),
        widget.loader ??
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoaderWidget.withIndicator(radius: 20.dp()),
                Gap(20.dp()),
                Text(
                  "Loading more ...",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
        Gap(60.dp()),
      ],
    )
        : const SizedBox.shrink();
  }

  List<Widget> _withGridView(BuildContext context) {
    List<Widget> rows = [];
    List<Widget> column = [];

    final emptyPlaceHolder =
    Flexible(flex: 1, child: SizedBox(width: appDimen.screenWidth));

    for (int i = 0; i < widget.items.length; i++) {
      Widget widgetItem = Flexible(
        flex: 1,
        child: widget.parser(widget.items[i]),
      );
      rows.add(widgetItem);

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
      } else if (i == widget.items.length - 1 && widget.items.length % 2 != 0) {
        column.add(Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [widgetItem, Gap(8.dp()), emptyPlaceHolder],
        ));
        column.add(Gap(8.dp()));
      }
    }

    column.add(Center(child: _loadingMore(context)));
    return column;
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        if (widget.onRefresh == null) return;
        final results = await widget.onRefresh?.call();
        if (results == null || results.isEmpty) return;
        widget.items.value = results;
      },
      child: Obx(
        ()=> ListView(
          controller: scrollController,
          primary: widget.primary,
          shrinkWrap: widget.shrinkWrap ?? false,
          padding: widget.padding ??
              EdgeInsets.symmetric(horizontal: 5.dp(), vertical: 10.dp()),
          scrollDirection: Axis.vertical,
          children: widget.withGridView
              ? _withGridView(context)
              : [
            ...widget.items.map((e) => widget.parser(e)),
            _loadingMore(context),
          ],
        ),
      ),
    );
  }
}

