import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:core_module/core/def/global_definitions.dart';

class LoaderWidget extends StatelessWidget {
  final Color? color;
  final double? radius;
  final BuildContext? context;
  final bool indicator;
  final bool progressIndicator;

  const LoaderWidget({
    super.key,
    this.color,
    this.radius,
  })  : progressIndicator = false,
        context = null,
        indicator = false;

  ///Circular progress Indicator
  const LoaderWidget.withProgressIndicator({
    super.key,
    this.color,
    this.radius,
  })  : progressIndicator = true,
        context = null,
        indicator = false;

  const LoaderWidget.withIndicator({
    super.key,
    this.color,
    this.radius,
  })  : progressIndicator = false,
        context = null,
        indicator = true;

  ///Circular progress Indicator
  Future<void> showProgressIndicator({required context, Widget? child, bool autoDismiss = true}) async {
    Loader.show(
      context,
      progressIndicator: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _circularProgressIndicator(context),
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
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (progressIndicator) {
      return _circularProgressIndicator(context);
    }

    if (indicator) {
      return _progressIndicator(context);
    }

    return const SizedBox.shrink();
  }

  ///This is an Extension of [circularProgressIndicator] with a square background
  ///A Circular progress indicator copied from cupertino style
  /// An iOS-style activity indicator that spins clockwise.
  ///
  /// {@youtube 560 315 https://www.youtube.com/watch?v=AENVH-ZqKDQ}
  ///
  Widget _circularProgressIndicator(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(appDimen.dimen(20))),
        color: colorScheme.inverseSurface,
      ),
      padding: EdgeInsets.all(appDimen.dimen(30)),
      child: CupertinoActivityIndicator(
        animating: true,
        color: color ?? colorScheme.tertiary,
        radius: radius ?? appDimen.dimen(40),
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
}
