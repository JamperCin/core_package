import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';

import 'divider_widget.dart';

class ListItemWidget extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final Color? selectedIconColor;
  final TextStyle? style;
  final bool shouldGoBack;
  final Function(String)? onTap;

  const ListItemWidget({
    super.key,
    required this.items,
    this.selectedItem,
    this.shouldGoBack = true,
    this.onTap,
    this.style, this.selectedIconColor,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ...items.map(
          (e) => Column(
            children: [
              TextButtonWidget(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.dp(),
                  vertical: 10.dp(),
                ),
                onTap: () {
                  if (shouldGoBack) {
                    navUtils.fireBack();
                  }
                  if (onTap != null) onTap!(e);
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        e,
                        style: style ?? textTheme.bodyMedium,
                      ),
                    ),
                    if (e == selectedItem)
                      Icon(
                        Icons.check_circle,
                        size: 20.dp(),
                        color: selectedIconColor ?? colorScheme.primary,
                      )
                  ],
                ),
              ),
              Gap(5.dp()),
              DividerWidget(color: colorScheme.outline),
              Gap(5.dp()),
            ],
          ),
        )
      ],
    );
  }
}
