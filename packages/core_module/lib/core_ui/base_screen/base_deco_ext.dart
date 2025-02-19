import 'package:flutter/material.dart';

abstract class BaseDecoExt{
  String decoPageAsset();
  double decoPageTopPadding();
  double decoAssetHeight();
  double decoAssetWidth();
  Color decoBgBlurColor(BuildContext context);
  bool rotateAsset();
  Positioned decoBackPosition();

}