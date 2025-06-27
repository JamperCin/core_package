import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:core_module/src/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ConfirmTransactionLayout extends StatelessWidget {
  final String title;
  final String subTitle;
  final String? cancelAsset;
  final Color? cancelAssetColor;
  final Color? cancelBackgroundColor;
  final String buttonTitle;
  final GestureTapCallback? onTap;
  final Widget? child;
  final bool displayCancelButton;
  final Widget? cancelWidget;
  final TextStyle? titleStyle;
  final CrossAxisAlignment? crossAxisAlignment;
  final TextStyle? subTitleStyle;
  final TextStyle? buttonStyle;

  const ConfirmTransactionLayout({
    super.key,
    this.title = '',
    this.subTitle = '',
    this.buttonTitle = 'Proceed',
    this.onTap,
    this.child,
    this.titleStyle,
    this.subTitleStyle,
    this.buttonStyle,
    this.displayCancelButton = true,
    this.crossAxisAlignment,
    this.cancelAsset,
    this.cancelAssetColor,
    this.cancelBackgroundColor,
    this.cancelWidget,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SizedBox(height: 2.dp()),
        DividerWidget(width: 70.dp(), height: 1.dp()),
        Padding(
          padding: EdgeInsets.only(right: 20.dp()),
          child: Align(
            alignment: Alignment.centerRight,
            child: displayCancelButton ? (cancelWidget ??
                ContainerWidget.withCircular(
                  onTap: () => navUtils.fireBack(),
                  color: cancelBackgroundColor ?? colorScheme.primary,
                  radius: 30.dp(),
                  padding: EdgeInsets.all(4.dp()),
                  child: Center(
                      child: AssetImageWidget(
                    asset: cancelAsset ?? icCancel,
                    assetColor: cancelAssetColor,
                  )),
                )) : const SizedBox.shrink(),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 20.dp(),
              vertical: 24.dp(),
            ),
            child: Column(
              crossAxisAlignment:
                  crossAxisAlignment ?? CrossAxisAlignment.center,
              children: [
                Text(title, style: titleStyle ?? textTheme.displayMedium),
                if (subTitle.isNotEmpty) Gap(10.dp()),
                if (subTitle.isNotEmpty)
                  Text(subTitle, style: subTitleStyle ?? textTheme.labelMedium),
                Gap(20.dp()),
                child ?? const SizedBox.shrink(),
              ],
            ),
          ),
        ),
        if(onTap != null)
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.dp()),
          child: ButtonWidget(
            text: buttonTitle,
            style: buttonStyle,
            onTap: () {
              navUtils.fireBack();
              onTap?.call();
            },
            height: 45.dp(),
          ),
        ),
        Gap(25.dp()),
      ],
    );
  }
}
