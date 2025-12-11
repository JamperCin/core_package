import 'dart:math';

import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core_ui/base_screen/base_deco_ext.dart';
import 'package:core_module/core_ui/base_screen/base_screen_stateful_impl.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:flutter/material.dart';

 abstract class BaseScreenStatefulDec extends BaseScreenStatefulImpl
    implements BaseDecoExt {

  ///body goes here
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
    return 400.dp();
  }

  @override
  double decoAssetWidth() {
    return 400.dp();
  }

  @override
  double decoPageTopPadding() {
    return 70.dp();
  }

  @override
  Color decoBgBlurColor(BuildContext context) {
    return colorScheme.tertiary.withOpacity(0.8);
  }

  @override
  Positioned decoBackPosition() {
    return Positioned(
      right: -80.dp(),
      top: -70.dp(),
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
                  left: 20.dp(),
                  right: 20.dp(),
                  top: decoPageTopPadding(),
                  bottom: 20.dp(),
                ),
                child: page(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose(SingleTickerProviderStateMixin<StatefulWidget> vsync) {}

  @override
  void initState(SingleTickerProviderStateMixin<StatefulWidget> vsync) {}

  @override
  bool showAppBar() {
    return false;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return backgroundColor(context);
  }
}
