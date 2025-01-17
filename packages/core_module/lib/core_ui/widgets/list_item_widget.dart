import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';

import 'divider_widget.dart';

class ListItemWidget extends StatelessWidget {
  final List<String> items;
  final String? selectedItem;
  final TextStyle? style;
  final bool shouldGoBack;
  final Function(String)? onTap;

  const ListItemWidget({
    super.key,
    required this.items,
    this.selectedItem,
    this.shouldGoBack = true,
    this.onTap,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        ...items.map(
          (e) => TextButtonWidget(
            padding: EdgeInsets.only(
              left: appDimen.dimen(2),
              right: appDimen.dimen(2),
            ),
            onTap: () {
              if (shouldGoBack) {
                navUtils.fireBack();
              }
              if (onTap != null) onTap!(e);
            },
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        e,
                        style: style ??
                            textTheme.titleSmall
                                ?.copyWith(fontSize: appDimen.dimen(8)),
                      ),
                    ),
                    if (e == selectedItem)
                      Icon(
                        Icons.check_circle,
                        size: appDimen.dimen(4),
                        color: colorScheme.outline,
                      )
                  ],
                ),
                SizedBox(height: appDimen.dimen(-5)),
                DividerWidget(color: colorScheme.secondary),
              ],
            ),
          ),
        )
      ],
    );
  }
}
