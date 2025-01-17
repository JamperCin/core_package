import 'package:core_module/core/app/app_module_colors.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/model/remote/delivery_mode_model.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';

class DeliveryModeItemWidget extends StatelessWidget {
  final DeliveryModeModel model;
  final Function(DeliveryModeModel)? onTap;
  final BorderRadiusGeometry? border;
  final BoxBorder? borderSide;

  const DeliveryModeItemWidget({
    super.key,
    this.onTap,
    required this.model,
  })  : border = null,
        borderSide = null;

  DeliveryModeItemWidget.withUpperBorder({
    super.key,
    this.onTap,
    required this.model,
  })  : border = const BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
        borderSide = Border(
          bottom: BorderSide(
            color: greyPodActiveColor,
            width: 0.5,
          ),
          top: BorderSide(
            color: greyPodActiveColor,
            width: 1,
          ),
          left: BorderSide(
            color: greyPodActiveColor,
            width: 1,
          ),
          right: BorderSide(
            color: greyPodActiveColor,
            width: 1,
          ),
        );

  DeliveryModeItemWidget.withLowerBorder({
    super.key,
    this.onTap,
    required this.model,
  })  : border = const BorderRadius.only(
          bottomLeft: Radius.circular(5),
          bottomRight: Radius.circular(5),
        ),
        borderSide = Border(
          bottom: BorderSide(
            color: greyPodActiveColor,
            width: 1,
          ),
          top: BorderSide(
            color: greyPodActiveColor,
            width: 0.5,
          ),
          left: BorderSide(
            color: greyPodActiveColor,
            width: 1,
          ),
          right: BorderSide(
            color: greyPodActiveColor,
            width: 1,
          ),
        );

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return ContainerWidget(
      onTap: () {
        if (onTap != null) {
          if (!model.selected) {
            navUtils.fireBack();
          }
          onTap!(model);
        }
      },
      height: appDimen.dimen(55),
      width: appDimen.screenWidth,
      borderColor: colorScheme.inverseSurface,
      color: colorScheme.tertiary,
      border: border ??
          const BorderRadius.all(
            Radius.circular(5),
          ),
      borderSide: borderSide,
      padding: EdgeInsets.symmetric(horizontal: appDimen.dimen(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
            children: [
              AssetImageWidget(
                asset: model.asset,
                height: appDimen.dimen(20),
                width: appDimen.dimen(20),
              ),
              SizedBox(width: appDimen.dimen(5)),
              Text(
                model.title,
                style: textTheme.bodyMedium,
              )
            ],
          )),
          // if(onTap != null)
          SizedBox(width: appDimen.dimen(1)),
          //if(onTap != null)
          Icon(
            model.selected ? Icons.check_circle : Icons.circle_outlined,
            size: appDimen.dimen(10),
            color: model.selected
                ? colorScheme.outline
                : colorScheme.inverseSurface,
          )
        ],
      ),
    );
  }
}
