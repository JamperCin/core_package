import 'package:flutter/material.dart';

///Decoration snippet for container
Decoration deco({
  required BuildContext context,
  BorderRadiusGeometry? border,
  double borderRadius = 10,
  double opacity = 0.4,
  double borderWidth = 1,
  Color? color,
  Color? borderColor,
  Color? colorOpacity,
  double blurRadius = 5,
  BoxBorder? borderSide,
  bool applyBorder = true,
  Gradient? gradient,
}) {
  final colorScheme = Theme.of(context).colorScheme;

  ///the BBoxDeco
  return BoxDecoration(
    color: color ?? colorScheme.inverseSurface,
    borderRadius: applyBorder
        ? (border ?? BorderRadius.all(Radius.circular(borderRadius)))
        : null,
    boxShadow: <BoxShadow>[
      BoxShadow(
        color: colorOpacity ?? colorScheme.inverseSurface.withOpacity(opacity),
        offset: const Offset(1.1, 1.1),
        blurRadius: blurRadius,
      ),
    ],
    border: borderSide ??
        Border.all(
          color: borderColor ?? colorScheme.inverseSurface,
          width: borderWidth,
        ),
    gradient: gradient,
  );
}
