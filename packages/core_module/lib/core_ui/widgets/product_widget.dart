import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core_ui/widgets/network_image_widget.dart';

import 'container_widget.dart';

class ProductWidget extends StatelessWidget {
  final bool isSpecialOffer;
  final String url;
  final String? discount;
  final String? offerDescription;
  final VoidCallback? onClaimOnTap;

  const ProductWidget({super.key, required this.url})
      : isSpecialOffer = false,
        discount = null,
        offerDescription = null,
        onClaimOnTap = null;

  const ProductWidget.withSpecialOffer({
    super.key,
    required this.url,
    this.discount,
    this.offerDescription,
    this.onClaimOnTap,
  }) : isSpecialOffer = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (isSpecialOffer) {
      return NetworkImageWidget(
        url: url,
        setOverlay: true,
        childOnOverlay: _specialOfferOverlayWidget(context),
      );
    }

    return NetworkImageWidget(url: url);
  }

  Widget _specialOfferOverlayWidget(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContainerWidget(
          height: appDimen.dimen(15),
          borderRadius: 5,
          width: appDimen.dimen(100),
          color: colorScheme.primaryFixedDim,
          child: Center(
            child: Text(offerDescription ?? "Limited Offer",
                style: textTheme.labelMedium?.copyWith(
                  fontSize: appDimen.dimen(0.05),
                  color: colorScheme.tertiary,
                )),
          ),
        ),
        SizedBox(height: appDimen.dimen(1)),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: "Get Special Offer\n",
            style: textTheme.titleMedium?.copyWith(color: colorScheme.tertiary),
          ),
          TextSpan(
            text: "Up to  ",
            style: textTheme.labelMedium?.copyWith(color: colorScheme.tertiary),
          ),
          TextSpan(
            text: discount ?? "40%",
            style:
                textTheme.displayLarge?.copyWith(color: colorScheme.tertiary),
          ),
        ])),
        SizedBox(height: appDimen.dimen(3)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("All Services Available | T&C Apply",
                style: textTheme.labelMedium?.copyWith(
                  fontSize: appDimen.dimen(-2.0),
                  color: colorScheme.tertiary,
                )),
            ContainerWidget(
              height: appDimen.dimen(15),
              borderRadius: 5,
              width: appDimen.dimen(80),
              color: colorScheme.primaryContainer,
              child: Center(
                child: Text("Claim",
                    style: textTheme.labelMedium?.copyWith(
                      fontSize: appDimen.dimen(0.05),
                    )),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
