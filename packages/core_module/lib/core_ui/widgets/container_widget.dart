import 'package:core_module/core/def/global_definitions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final Widget? child;
  final bool isCircular;
  final bool isCircularNotch;
  final double? borderRadius;
  final double? height;
  final BorderRadiusGeometry? border;
  final BoxBorder? borderSide;
  final double? width;
  final double? radius;
  final double? borderWidth;
  final Color? color;
  final bool dottedBorder;
  final Color? borderColor;
  final EdgeInsets? padding;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;

  const ContainerWidget({
    super.key,
    this.child,
    this.borderRadius,
    this.color,
    this.border,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.onTap,
    this.borderWidth,
    this.borderColor,
    this.borderSide,
  })  : isCircular = false, isCircularNotch = false,
        dottedBorder = false,
        radius = null;

  const ContainerWidget.withDottedBorder({
    super.key,
    this.child,
    this.borderRadius,
    this.color,
    this.height,
    this.width,
    this.padding,
    this.margin,
    this.onTap,
    this.borderWidth,
    this.borderColor,
  })  : isCircular = false,
        dottedBorder = true,
        isCircularNotch = false,
        border = null,
        borderSide = null,
        radius = null;

  const ContainerWidget.withCircular({
    super.key,
    this.child,
    this.color,
    this.radius,
    this.padding,
    this.margin,
    this.borderColor,
    this.onTap,
    this.borderWidth,
  })  : isCircular = true,
        borderRadius = null,
        dottedBorder = false,
        isCircularNotch = false,
        height = null,
        borderSide = null,
        border = null,
        width = null;


  const ContainerWidget.withCircularNotch({
    super.key,
    this.child,
    this.color,
    this.height,
    this.width,
    this.padding,
    this.margin,
  })  : isCircular = false,
        borderRadius = null,
        borderColor = null,
        onTap = null,
        borderWidth = null,
        dottedBorder = false,
        isCircularNotch = true,
        radius = null,
        borderSide = null,
        border = null;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    if (dottedBorder) {
      return InkWell(
        onTap: onTap,
        child: DottedBorder(
          color: borderColor ?? colorScheme.surfaceDim,
          dashPattern: const [8, 8, 8, 8],
          strokeWidth: borderWidth ?? 1,
          borderType: BorderType.RRect,
          radius: Radius.circular(borderRadius ?? 10),
          padding: padding ??
              EdgeInsets.symmetric(
                  horizontal: appDimen.dimen(10), vertical: appDimen.dimen(4)),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 6)),
            child: child,
          ),
        ),
      );
    }

    if (isCircular) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: radius,
          width: radius,
          margin: margin,
          padding: padding,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color ?? colorScheme.secondary,
            border: Border.all(
              color: borderColor ?? color ?? colorScheme.secondary,
              width: borderWidth ?? 1,
            ),
          ),
          child: child,
        ),
      );
    }

    if (isCircularNotch) {
      return ClipPath(
        clipper: NotchClipper(),
        child: Container(
          color: color,
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          child: child,
        ),
      );
    }



    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? appDimen.dimen(180),
        width: width ?? appDimen.dimen(180),
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color ?? colorScheme.secondary,
          borderRadius: border ?? BorderRadius.all(
            Radius.circular(borderRadius ?? 10),
          ),
          border: borderSide ?? Border.all(
            color: borderColor ?? color ?? colorScheme.secondary,
            width: borderWidth ?? 1,
          ),
        ),
        child: child,
      ),
    );
  }
}

class NotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double notchRadius = appDimen.dimen(100);
    final double notchWidth = appDimen.dimen(150);
    const double notchEdgeRadius = 10.0; // Radius for the rounded inner edges
    final double notchCenterX = size.width / 2;

    Path path = Path()
      ..moveTo(0, 0)
      ..lineTo(notchCenterX - notchWidth / 2 - notchEdgeRadius, 0)
      ..quadraticBezierTo(
        notchCenterX - notchWidth / 2,
        0,
        notchCenterX - notchWidth / 2 + notchEdgeRadius,
        notchEdgeRadius,
      )
      ..arcToPoint(
        Offset(
          notchCenterX + notchWidth / 2 - notchEdgeRadius,
          notchEdgeRadius,
        ),
        radius: Radius.circular(notchRadius),
        clockwise: false,
      )
      ..quadraticBezierTo(
        notchCenterX + notchWidth / 2,
        0,
        notchCenterX + notchWidth / 2 + notchEdgeRadius,
        0,
      )
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
