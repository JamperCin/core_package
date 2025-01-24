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
  double decoPageTopPadding() {
    return appDimen.dimen(70);
  }

  @override
  Widget body(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme.tertiary,
      body: Stack(
        children: [
          Positioned(
            right: -appDimen.dimen(80),
            top: -appDimen.dimen(70),
            child: Transform.rotate(
              angle: rotateAsset() ? (pi / 90 * 13) : 0,
              child: AssetImageWidget(
                height: appDimen.dimen(400),
                width: appDimen.dimen(400),
                asset: decoPageAsset(),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              color: colorScheme.tertiary.withOpacity(0.8),
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
