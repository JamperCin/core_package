
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/widgets/list_item_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';

import 'bottom_sheet_widget.dart';

class DayMonthPickerWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController dayCtrl;
  final TextEditingController monthCtrl;

  DayMonthPickerWidget({
    super.key,
    this.labelText = '',
    required this.dayCtrl,
    required this.monthCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (labelText.isNotEmpty)
          Text(labelText,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(fontWeight: FontWeight.w400)),
        if (labelText.isNotEmpty) SizedBox(height: appDimen.dimen(3.0)),
        Row(
          children: [
            _textField(
              context,
              ctrl: dayCtrl,
              hintText: 'Day',
              onTap: () {
                _onShowDayBottomSheet(context);
              },
            ),
            SizedBox(width: appDimen.dimen(2)),
            _textField(
              context,
              ctrl: monthCtrl,
              hintText: 'Month',
              onTap: () {
                _onShowMonthBottomSheet(context);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _textField(
    BuildContext context, {
    String hintText = '',
    VoidCallback? onTap,
    TextEditingController? ctrl,
  }) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Flexible(
      child: TextFieldWidget(
          isEnabled: false,
          onTap: onTap,
          hintText: hintText,
          hintStyle: textTheme.bodySmall,
          controller: ctrl,
          suffixIcon: Icon(
            Icons.keyboard_arrow_down_rounded,
            size: appDimen.dimen(10),
            color: colorScheme.inverseSurface,
          )),
    );
  }

  final List<String> _months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  List<String> _days() {
    switch (monthCtrl.text) {
      case "April":
      case "June":
      case "November":
      case "September":
        return List<String>.generate(
          30,
          (int index) => "${index + 1}",
        );
      case "February":
        return List<String>.generate(
          29,
          (int index) => "${index + 1}",
        );
      default:
        return List<String>.generate(
          31,
          (int index) => "${index + 1}",
        );
    }
  }

  void _onShowDayBottomSheet(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    if (monthCtrl.text.isEmpty) {
      snackBarSnippet.snackBarError("Kindly select month first");
      return;
    }

    _showBottomSheet(
      context,
      selectedItem: dayCtrl.text,
      data: _days(),
      title: "Select Day",
      onTap: (day) {
        dayCtrl.text = day;
        debugPrint("Selected day: $day ==> ${dayCtrl.text}");
      },
    );
  }

  void _onShowMonthBottomSheet(BuildContext context) {
    _showBottomSheet(
      context,
      data: _months,
      selectedItem: monthCtrl.text,
      title: "Select Month",
      onTap: (month) {
        monthCtrl.text = month;
        dayCtrl.text = '';
        debugPrint("Selected day: $month ==> ${monthCtrl.text}");
      },
    );
  }

  void _showBottomSheet(
    BuildContext context, {
    String title = '',
    String selectedItem = '',
    required List<String> data,
    Function(String)? onTap,
  }) {
    BottomSheetWidget(
      context: context,
      title: title,
      subChild: ListItemWidget(
        items: data,
        selectedItem: selectedItem,
        onTap: onTap,
      ),
    );
  }
}
