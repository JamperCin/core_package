import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/res/assets_image_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';

import '../../core/model/remote/location_search_model.dart';


class LocationDisplayWidget extends StatelessWidget {
  final VoidCallback onTap;
  final String? location;
  final double? width;

  const LocationDisplayWidget({
    super.key,
    required this.onTap,
    this.location,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        AssetImageWidget(
          asset: icLocation,
          height: appDimen.dimen(8),
          width: appDimen.dimen(8),
          assetColor: colorScheme.tertiary,
        ),
        FutureBuilder(
          future: appPreference.getLocation(),
          builder: (BuildContext context,
              AsyncSnapshot<LocationSearchModel> snapshot) {
            return ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: width ?? appDimen.screenWidth * 0.55),
              child: TextButtonWidget(
                style:
                    textTheme.labelLarge?.copyWith(color: colorScheme.tertiary),
                onTap: onTap,
                //text: location ?? snapshot.data?.address ?? '',
                child: RichText(
                    maxLines: 1,
                    text: TextSpan(children: [
                      TextSpan(
                        text: location ?? snapshot.data?.address ?? '',
                        style: textTheme.labelLarge
                            ?.copyWith(fontSize: appDimen.dimen(0.5))
                            .copyWith(color: colorScheme.tertiary),
                      )
                    ])),
              ),
            );
          },
        ),
        AssetImageWidget(
          asset: icArrowDown,
          height: appDimen.dimen(-2),
          width: appDimen.dimen(-2),
          assetColor: colorScheme.tertiary,
        ),
      ],
    );
  }
}
