import 'package:cached_network_image/cached_network_image.dart';
import 'package:core_module/core/app/app_module_colors.dart';
import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/res/assets_image_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? url;
  final double? radius;
  final double? height;
  final double? width;
  final double? borderRadius;
  final String? placeholder;
  final String? heroTag;
  final BoxFit? fit;
  final Widget? childOnOverlay;
  final GestureTapCallback? onTap;
  final bool setOverlay;
  final bool isCircular;

  const NetworkImageWidget({
    super.key,
    this.onTap,
    this.placeholder,
    this.height,
    this.width,
    this.childOnOverlay,
    this.heroTag,
    this.setOverlay = false,
    this.url,
    this.fit,
  })  : radius = null,
        borderRadius = null,
        isCircular = false;

  const NetworkImageWidget.withCircular({
    super.key,
    this.onTap,
    this.placeholder,
    this.radius,
    this.fit,
    this.heroTag,
    this.borderRadius,
    this.childOnOverlay,
    this.setOverlay = false,
    this.url,
  })  : isCircular = true,
        height = 0,
        width = 0;

  @override
  Widget build(BuildContext context) {
    double newHeight = isCircular
        ? (radius ?? appDimen.dimen(60))
        : (height ?? appDimen.screenWidth * .44);

    double newWidth = isCircular
        ? (radius ?? appDimen.dimen(60))
        : (width ?? appDimen.screenWidth * 0.8);

    if (url == null || url!.isEmpty) {
      return GestureDetector(
        onTap: onTap,
        child: AssetImageWidget(
          asset: isCircular ?  icProfileCircle : (placeholder ?? icKaydGrey),
          height: newHeight,
          width: newWidth,
        ),
      );
    }

    if (isCircular) {
      return GestureDetector(
        onTap: onTap,
        child: setOverlay
            ? Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: greySecondaryColor.withOpacity(.3),
                    backgroundImage: NetworkImage(url ?? ''),
                    radius: newHeight,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(.5),
                    radius: newHeight,
                  ),
                  if (childOnOverlay != null)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: newHeight,
                        maxHeight: newHeight,
                      ),
                      child: childOnOverlay!,
                    ),
                  // if (childOnOverlay != null) childOnOverlay!,
                ],
              )
            : CircleAvatar(
                backgroundColor: greySecondaryColor.withOpacity(.3),
                backgroundImage: NetworkImage(url ?? ''),
                radius: newHeight,
              ),
      );
    }

    var image = CachedNetworkImage(
      imageUrl: url!,
      height: newHeight,
      width: newWidth,
      fit: fit ?? BoxFit.fill,
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: AssetImageWidget(
          asset: placeholder ?? icKaydGrey,
          height: newHeight,
          width: newWidth,
        ),
      ),
      errorWidget: (context, url, error) => Icon(
        Icons.error,
        size: newHeight / 2,
        color: Colors.red,
      ),
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: newWidth,
        maxHeight: newHeight,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 10),
              child: heroTag != null
                  ? Hero(
                      tag: heroTag!,
                      transitionOnUserGestures: true,
                      child: image,
                    )
                  : image,
            ),
            setOverlay
                ? ContainerWidget(
                    height: newHeight,
                    width: newWidth,
                    color: Colors.black.withOpacity(.5),
                    borderRadius: borderRadius,
                  )
                : const SizedBox.shrink(),
            if (childOnOverlay != null)
              Padding(
                padding: EdgeInsets.all(appDimen.dimen(1)),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: newWidth - appDimen.dimen(10),
                    maxHeight: newHeight - appDimen.dimen(10),
                  ),
                  child: childOnOverlay!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
