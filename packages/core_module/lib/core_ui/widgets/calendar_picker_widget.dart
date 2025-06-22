import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottom_sheet_widget.dart';

class CalendarPickerWidget extends StatelessWidget {
  final Rx<DateTime> _selectedDate = DateTime.now().obs;
  final BuildContext? context;
  final Function(DateTime)? onSelectDate;
  final Color? backgroundColor;
  final double? height;
  final Color? okButtonColor;
  final Color? cancelButtonColor;
  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? currentDate;
  final int? numOfYearsBack;
  final String okButtonText;
  final String cancelButtonText;
  final TextStyle? okButtonTextStyle;
  final TextStyle? cancelButtonTextStyle;

  CalendarPickerWidget({
    super.key,
    this.onSelectDate,
    this.backgroundColor,
    this.okButtonColor,
    this.cancelButtonColor,
    this.startDate,
    this.endDate,
    this.currentDate,
    this.numOfYearsBack,
    this.okButtonText = "OK",
    this.cancelButtonText = "Cancel",
    this.okButtonTextStyle,
    this.cancelButtonTextStyle,
  })  : context = null,
        height = null;

  CalendarPickerWidget.show({
    super.key,
    required this.context,
    this.onSelectDate,
    this.backgroundColor,
    this.okButtonColor,
    this.cancelButtonColor,
    this.startDate,
    this.endDate,
    this.currentDate,
    this.numOfYearsBack,
    this.height,
    this.okButtonText = "OK",
    this.cancelButtonText = "Cancel",
    this.okButtonTextStyle,
    this.cancelButtonTextStyle,
  }) {
    _showSingleCalendar(context!);
  }

  @override
  Widget build(BuildContext context) {
    return _singleCalendarWidget(context);
  }

  void _showSingleCalendar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    BottomSheetWidget(
      context: context,
      height: height,
      color: backgroundColor ?? Theme.of(context).colorScheme.surface,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _singleCalendarWidget(context),
            SizedBox(height: 20.dp()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButtonWidget(
                  onTap: () => navUtils.fireBack(),
                  textColor: cancelButtonColor ?? colorScheme.inverseSurface,
                  text: cancelButtonText,
                  style: cancelButtonTextStyle,
                ),
                SizedBox(height: 40.dp()),
                TextButtonWidget(
                  onTap: () {
                    navUtils.fireBack();
                    onSelectDate?.call(_selectedDate.value);
                  },
                  textColor: okButtonColor ?? colorScheme.inverseSurface,
                  text: okButtonText,
                  style: okButtonTextStyle,
                ),
                SizedBox(height: 20.dp()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _singleCalendarWidget(BuildContext context) {
    return Obx(
      () => CalendarDatePicker(
        initialDate: currentDate ?? DateTime.now(),
        currentDate: _selectedDate.value,
        firstDate:
            startDate ?? DateTime(DateTime.now().year - (numOfYearsBack ?? 5)),
        lastDate: endDate ?? DateTime.now(),
        onDateChanged: (date) {
          _selectedDate.value = date;
        },
      ),
    );
  }
}
