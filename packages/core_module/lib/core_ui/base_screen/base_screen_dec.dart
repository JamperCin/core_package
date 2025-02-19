import 'dart:math';

import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_ui/base_screen/base_deco_ext.dart';
import 'package:core_module/core_ui/base_screen/base_screen_impl.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

abstract class BaseScreenDecorated extends BaseScreenImpl
    implements BaseDecoExt {
  ///This is the main page that is rendered on top of this main page
  ///Use this as the main design to the page
  Widget page(BuildContext context);

  @override
  String decoPageAsset() {
    return "";
  }

  @override
  bool rotateAsset() {
    return true;
  }

  @override
  double decoAssetHeight() {
   return appDimen.dimen(400);
  }

  @override
  double decoAssetWidth() {
   return appDimen.dimen(400);
  }

  @override
  double decoPageTopPadding() {
    return appDimen.dimen(70);
  }

  @override
  Color decoBgBlurColor(BuildContext context) {
   return colorScheme.tertiary.withOpacity(0.8);
  }

  @override
  Positioned decoBackPosition() {
   return Positioned(
     right: -appDimen.dimen(80),
     top: -appDimen.dimen(70),
     child: Transform.rotate(
       angle: rotateAsset() ? (pi / 90 * 13) : 0,
       child: AssetImageWidget(
         height: decoAssetHeight(),
         width: decoAssetWidth(),
         asset: decoPageAsset(),
       ),
     ),
   );
  }

  @override
  Color backgroundColor(BuildContext context) {
    return colorScheme.tertiary;
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor(context),
      body: Stack(
        children: [
          decoBackPosition(),
          Positioned.fill(
            child: Container(
              color: decoBgBlurColor(context),
              child: Padding(
                padding: EdgeInsets.only(
                  left: appDimen.dimen(20),
                  right: appDimen.dimen(20),
                  top: decoPageTopPadding(),
                  bottom: appDimen.dimen(20),
                ),
                child: page(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
