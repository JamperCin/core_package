import 'package:flutter/material.dart';
import 'package:core_module/core_ui/base_screen/base_search_delegate.dart';

import '../../core/def/global_def.dart';

class BaseSearchStandard<T> extends BaseSearchDelegate<T> {
  @override
  Future<List<T>> fetchSuggestions({required String query}) async {
    return [];
  }

  @override
  double cardElevation() {
    return 5;
  }

  @override
  Widget cardWidget(BuildContext context, T item) {
    return Card(
      elevation: cardElevation(),
      margin: EdgeInsets.only(
        left: appDimen.dimen(10),
        right: appDimen.dimen(10),
        top: appDimen.dimen(5),
      ),
      child: listItemWidget(context, item),
    );
  }

  @override
  Widget filterWidget() {
    return const SizedBox.shrink();
  }

  @override
  Widget listWidget(BuildContext context, List<T> items) {
    return ListView.builder(
      itemBuilder: (context, index) => cardWidget(context, items[index]),
      itemCount: (items.length),
    );
  }

  @override
  Widget listItemWidget(BuildContext context, T item) {
    return const SizedBox.shrink();
  }

  @override
  Widget? loadingWidget() {
    return null;
  }

  @override
  void onClose(BuildContext context) {}

  @override
  void setContext(BuildContext context) {}

  @override
  Widget suggestionsHistory(BuildContext context) {
    return const SizedBox.shrink();
  }
}
