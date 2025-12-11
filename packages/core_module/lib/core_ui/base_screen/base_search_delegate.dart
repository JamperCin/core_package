import 'package:flutter/material.dart';
import 'package:core_module/src/app_style.dart';
import 'package:core_module/core/def/global_def.dart';

abstract class BaseSearchDelegate<T> extends SearchDelegate<T> {
  Future<List<T>> fetchSuggestions({required String query});
  Widget suggestionsHistory(BuildContext context);
  Widget listItemWidget(BuildContext context, T item);
  Widget listWidget(BuildContext context, List<T> items);
  Widget? loadingWidget();
  Widget filterWidget();
  Widget cardWidget(BuildContext context, T item);
  double cardElevation();
  void setContext(BuildContext context);
  void onClose(BuildContext context);

  @override
  List<Widget>? buildActions(BuildContext context) {
    setContext(context);

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return [
      IconButton(
        tooltip: 'Clear',
        icon: Icon(Icons.clear, size: appDimen.dimen(18)),
        onPressed: () {
          query = '';
        },
      ),
      filterWidget(),
    ];
  }

  @override
  String? get searchFieldLabel => 'Search...';

  @override
  TextStyle? get searchFieldStyle => labelMediumTextLightModeStyle;

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      tooltip: 'Back',
      icon: Icon(Icons.arrow_back, size: appDimen.dimen(18)),
      onPressed: () {
        onClose(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return suggestionsHistory(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder<List<T>>(
      future: query == "" ? null : fetchSuggestions(query: query),
      builder: (context, snapshot) => query == ''
          ? suggestionsHistory(context)
          : snapshot.hasData
              ? listWidget(context, snapshot.data!)
              : (loadingWidget() ??
                  Container(
                    child: Text(
                      'Loading...',
                      style: labelSmallTextLightModeStyle,
                    ),
                    padding: EdgeInsets.all(appDimen.dimen(10)),
                  )),
    );
  }
}
