import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

class BottomBarModel {
  final String? text;
  final String? asset;
  final IconData? icon;
  final bool isBadge;
  final bool isSelected;
  final int? count;
  final double? badgeTextSize;
  final double? badgeTextPadding;
  final double? iconSize;
  final Color? iconColor;
  final GlobalKey<AnimatorWidgetState>? key;

  BottomBarModel({
    this.text,
    this.asset,
    this.icon,
    this.isBadge = false,
    this.isSelected = false,
    this.count,
    this.badgeTextSize,
    this.badgeTextPadding,
    this.iconSize,
    this.iconColor,
    this.key,
  });

  // copyWith method
  BottomBarModel copyWith({
    String? text,
    String? asset,
    IconData? icon,
    bool? isBadge,
    bool? isSelected,
    int? count,
    double? badgeTextSize,
    double? badgeTextPadding,
    GestureTapCallback? onTap,
    double? iconSize,
    Color? iconColor,
    GlobalKey<AnimatorWidgetState>? key,
  }) {
    return BottomBarModel(
      text: text ?? this.text,
      asset: asset ?? this.asset,
      icon: icon ?? this.icon,
      isBadge: isBadge ?? this.isBadge,
      isSelected: isSelected ?? this.isSelected,
      count: count ?? this.count,
      badgeTextSize: badgeTextSize ?? this.badgeTextSize,
      badgeTextPadding: badgeTextPadding ?? this.badgeTextPadding,
      iconSize: iconSize ?? this.iconSize,
      iconColor: iconColor ?? this.iconColor,
      key: key ?? this.key,
    );
  }
}
