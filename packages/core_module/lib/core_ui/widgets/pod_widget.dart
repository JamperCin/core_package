import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/snippets/ui_snippet.dart';

class PodWidget extends StatefulWidget {
  final int podLength;
  final RxInt currentIndex;
  final Function(int)? onTap;
  final double? podSize;
  final double? podInActiveSize;
  final bool rectPod;
  final Color? activeColor;
  final Color? inActiveColor;

  const PodWidget({
    super.key,
    required this.podLength,
    required this.currentIndex,
    this.onTap,
    this.activeColor,
    this.inActiveColor,
    this.podSize,
    this.podInActiveSize,
    this.rectPod = false,
  });

  @override
  State<PodWidget> createState() => _PodWidgetState();
}

class _PodWidgetState extends State<PodWidget> {

  void _handleTap(int index) {
    widget.currentIndex.value = index;
    widget.onTap?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FittedBox(
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.podLength, (i) {
            final isActive = widget.currentIndex.value == i;
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: appDimen.dimen(6)),
              child: InkWell(
                onTap: () => _handleTap(i),
                child: widget.rectPod
                    ? Container(
                        width: isActive ? 30.dp() : 20.dp(),
                        height: isActive
                            ? widget.podSize ?? 4.dp()
                            : widget.podInActiveSize ?? 2.dp(),
                        decoration: deco(
                          color: isActive
                              ? widget.activeColor ?? colorScheme.primary
                              : widget.inActiveColor ?? colorScheme.outline,
                          borderColor: isActive
                              ? widget.activeColor ?? colorScheme.primary
                              : widget.inActiveColor ?? colorScheme.outline,
                          opacity: 0.2,
                          context: context,
                        ),
                      )
                    : Container(
                        width: isActive
                            ? widget.podSize ?? appDimen.dimen(12)
                            : widget.podInActiveSize ?? appDimen.dimen(6),
                        height: isActive
                            ? widget.podSize ?? appDimen.dimen(12)
                            : widget.podInActiveSize ?? appDimen.dimen(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isActive
                              ? widget.activeColor ?? colorScheme.primary
                              : widget.inActiveColor ?? colorScheme.outline,
                        ),
                      ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
