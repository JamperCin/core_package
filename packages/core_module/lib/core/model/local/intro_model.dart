import 'dart:ui';

import 'package:flutter/material.dart';

class IntroModel {
  final String assetName;
  final String mainText;
  final String subText;
  final Color color;

  const IntroModel({
    this.color = Colors.white,
    this.assetName = '',
    this.mainText = '',
    this.subText = '',
  });
}
