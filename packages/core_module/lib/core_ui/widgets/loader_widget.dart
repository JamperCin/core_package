import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:core_module/core/def/global_def.dart';

class LoaderWidget extends StatelessWidget {
  final Color? color;
  final double? radius;
  final double? strokeWidth;
  final BuildContext? context;
  final bool indicator;
  final bool progressIndicator;
  final bool circularIndicator;

  const LoaderWidget({
    super.key,
    this.color,
    this.radius,
  })  : progressIndicator = false,
   circularIndicator = false,
        context = null,
        strokeWidth = null,
        indicator = false;

  ///Circular progress Indicator
  const LoaderWidget.withProgressIndicator({
    super.key,
    this.color,
    this.radius,
  })  : progressIndicator = true,
        circularIndicator = false,
        context = null,
        strokeWidth = null,
        indicator = false;

  const LoaderWidget.withIndicator({
    super.key,
    this.color,
    this.radius,
  })  : progressIndicator = false,
        circularIndicator = false,
        context = null,
        strokeWidth = null,
        indicator = true;

  const LoaderWidget.withCircularIndicator({
    super.key,
    this.color,
    this.radius,
    this.strokeWidth,
  })  : progressIndicator = false,
        circularIndicator = true,
        context = null,
        indicator = false;

  ///Circular progress Indicator
  Future<void> showProgressIndicator({required context, Widget? child, bool autoDismiss = true}) async {
    Loader.show(
      context,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _iosProgressIndicator(context),
          child ?? const SizedBox.shrink(),
        ],
      ),
      //  themeData: Theme.of(context).copyWith(cc: Colors.black38),
      overlayColor: Colors.black.withOpacity(0.6),
      isAppbarOverlay: true,
      isBottomBarOverlay: true,
    );

    if(autoDismiss) {
      await Future.delayed(Duration(seconds: config.getTimeOut()));
      hideProgress();
    }
  }

  void hideProgress(){
    Loader.hide();
  }

  @override
  Widget build(BuildContext context) {

    if (progressIndicator) {
      return _iosProgressIndicator(context);
    }

    if (indicator) {
      return _progressIndicator(context);
    }

    if(circularIndicator){
      return _circularIndicator(context);
    }

    return const SizedBox.shrink();
  }

  ///This is an Extension of [circularProgressIndicator] with a square background
  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  Widget _iosProgressIndicator(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: colorScheme.inverseSurface,
      ),
      padding: EdgeInsets.all(appDimen.dimen(15)),
      child: CupertinoActivityIndicator(
        animating: true,
        color: color ?? colorScheme.tertiary,
        radius: radius ?? appDimen.dimen(20),
      ),
    );
  }

  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  Widget _progressIndicator(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return CupertinoActivityIndicator(
      animating: true,
      color: color ?? colorScheme.inverseSurface,
      radius: radius ?? appDimen.dimen(30),
    );
  }

  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  Widget _circularIndicator(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      height: radius,
      width: radius,
      child: CircularProgressIndicator(
        color: color ?? colorScheme.primary,
        strokeWidth: strokeWidth ?? 1.5,
      ),
    );
  }
}
