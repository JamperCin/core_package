import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';

class PromoCodeWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final TextEditingController? textController;
  final bool enabled;
  final String? title;
  final String? hint;

  const PromoCodeWidget({
    super.key,
    this.onTap,
    this.title,
    this.hint,
    this.enabled = true,
    this.textController,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Text(
            title ?? '',
            style: textTheme.bodySmall,
          ),
        if (title != null) SizedBox(height: appDimen.dimen(2)),
        Stack(
          children: [
            TextFieldWidget(
              onTap: enabled ? () {} : onTap,
              hintText: hint ?? "Promo code",
              isEnabled: enabled,
              backgroundColor: colorScheme.tertiary,
              margin: EdgeInsets.only(right: appDimen.dimen(10)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: IconButtonWidget.withCircularBorder(
                backgroundColor: colorScheme.inverseSurface,
                iconColor: colorScheme.tertiary,
                onTap: onTap,
                icon: Icons.arrow_forward,
                padding: EdgeInsets.all(appDimen.dimen(1)),
              ),
            ),
          ],
        )
      ],
    );
  }
}
