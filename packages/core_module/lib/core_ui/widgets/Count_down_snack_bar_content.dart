import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:flutter/material.dart';

class CountdownSnackBarContent extends StatefulWidget {
  final int durationSeconds;
  final Function()? onActionOnTap;
  final Color? progressFilledColor;
  final Color? progressUnfilledFilledColor;

  final Color? actionIconColor;
  final double? actionIconSize;
  final IconData? actionIcon;
  final String? message;
  final TextStyle? messageStyle;
  final Widget? messageWidget;
  final Widget? actionWidget;

  const CountdownSnackBarContent({
    super.key,
    required this.durationSeconds,
    this.progressFilledColor,
    this.progressUnfilledFilledColor,
    this.message,
    this.messageStyle,
    this.actionWidget,
    this.onActionOnTap,
    this.actionIconColor,
    this.actionIconSize,
    this.messageWidget,
    this.actionIcon,
  });

  @override
  State<CountdownSnackBarContent> createState() =>
      _CountdownSnackBarContentState();
}

class _CountdownSnackBarContentState extends State<CountdownSnackBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.durationSeconds),
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: widget.messageWidget ??
                      Text(
                        widget.message ?? '',
                        style: widget.messageStyle ?? textTheme.labelMedium,
                      ),
                ),
                SizedBox(width: 10.dp()),
                Flexible(
                    flex: 0,
                    child: widget.actionWidget ??
                        IconButtonWidget(
                          icon:
                              widget.actionIcon ?? Icons.shopping_cart_outlined,
                          onTap: widget.onActionOnTap,
                          iconSize: widget.actionIconSize ?? 20.dp(),
                          iconColor:
                              widget.actionIconColor ?? colorScheme.surface,
                        ))
              ],
            ),
            SizedBox(height: 5.dp()),
            LinearProgressIndicator(
              value: 1.0 - _controller.value,
              backgroundColor: widget.progressUnfilledFilledColor ??
                  colorScheme.surfaceBright,
              valueColor: AlwaysStoppedAnimation<Color>(
                  widget.progressFilledColor ?? colorScheme.primary),
            ),
          ],
        );
      },
    );
  }
}
