import 'package:core_module/core/def/global_def.dart';
import 'package:flutter/material.dart';

class DecoratedContainerWidget extends StatelessWidget {
  final Widget child;
  final List<Color>? colors;
  final List<double>? stops;
  final double? height;
  final double? width;
  final Alignment? begin;
  final Alignment? end;

  const DecoratedContainerWidget({
    super.key,
    required this.child,
    this.colors,
    this.stops,
    this.height,
    this.width,
    this.begin,
    this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? appDimen.screenHeight,
      width: width ?? appDimen.screenWidth,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin ?? Alignment.topCenter,
          end: end ?? Alignment.bottomCenter,
          colors: colors ??
              [
                Color(0xFFFFFFFF),
                Color(0xFFFFFFFF),
                Color(0xFFE9F4F6),
                Color(0xFFB3E3F3),
              ],
          stops: stops ??
              [
                0.0,
                0.5,
                0.7,
                1.0,
              ],
        ),
      ),
      child: child,
    );
  }
}
