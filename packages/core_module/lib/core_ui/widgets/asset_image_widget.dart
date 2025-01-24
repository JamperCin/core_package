import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/res/assets_path.dart';

class AssetImageWidget extends StatelessWidget {
  String asset;
  final double? height;
  final double? width;
  final double? size;
  final Color? assetColor;
  final BoxFit? fit;
  final VoidCallback? onTap;

  AssetImageWidget({
    super.key,
    required this.asset,
    this.width,
    this.height,
    this.assetColor,
    this.fit,
    this.onTap,
  }) : size = appDimen.dimen(150);

  @override
  Widget build(BuildContext context) {
    asset = asset.isEmpty ? icProfile : asset;

    return GestureDetector(
      onTap: onTap,
      child: GetUtils.isImage(asset)
          ? Image.asset(
              asset,
              height: height ?? size,
              width: width ?? size,
              color: assetColor,
              fit: fit,
            )
          : SvgPicture.asset(
              asset,
              height: height ?? size,
              width: width ?? size,
              color: assetColor,
              fit: fit ?? BoxFit.contain,
            ),
    );
  }
}
