import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/snippets/ui_snippet.dart';

class PodWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (currentIndex.value > podLength) {
      currentIndex.value = 0;
    }
    List<Widget> list = [];
    for (int i = 0; i < podLength; i++) {
      list.add(Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: InkWell(
            onTap: () {
              if (onTap != null) {
                onTap!(i);
              }
            },
            child: rectPod
                ? Container(
                    width: currentIndex.value == i
                        ? appDimen.dimen(24)
                        : appDimen.dimen(16),
                    height: currentIndex.value == i
                        ? appDimen.dimen(5)
                        : appDimen.dimen(4),
                    margin: EdgeInsets.only(right: appDimen.dimen(5)),
                    decoration: deco(
                      color: currentIndex.value == i
                          ? activeColor ?? colorScheme.primary
                          : inActiveColor ?? colorScheme.secondary,
                      opacity: 0.2,
                      context: context,
                    ),
                  )
                : Container(
                    width: currentIndex.value == i
                        ? podSize ?? appDimen.dimen(12)
                        : podInActiveSize ?? appDimen.dimen(6),
                    margin: EdgeInsets.only(right: appDimen.dimen(6)),
                    height: currentIndex.value == i
                        ? podSize ?? appDimen.dimen(12)
                        : podInActiveSize ?? appDimen.dimen(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex.value == i
                          ? activeColor ?? colorScheme.primary
                          : inActiveColor ?? colorScheme.secondary,
                    ),
                  ),
          ),
        ),
      ));
    }

    ///return row
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: list,
      ),
    );
  }
}
