import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/res/assets_image_path.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';

import '../../widgets/icon_button_widget.dart';

class ThirdPartyAuthWidget extends StatelessWidget {
  final bool isLoginAuth;

   const ThirdPartyAuthWidget({super.key}) : isLoginAuth = false;

  const ThirdPartyAuthWidget.withLogin({super.key}) : isLoginAuth = true;

  @override
  Widget build(BuildContext context) {
    return isLoginAuth ? _loginAuth(context) : _signUpAuth(context);
  }

  Widget _loginAuth(BuildContext context){
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            children: [
              IconButtonWidget.withCircularBorder(
                borderColor: colorScheme.inverseSurface,
                iconPadding: 2,
                child: AssetImageWidget(
                  asset: icPin,
                  height: appDimen.dimen(20),
                ),
              ),
              Text(
                "Pin Login",
                style: textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        SizedBox(width: appDimen.dimen(20)),
        Expanded(
          child: Column(
            children: [
              IconButtonWidget.withCircularBorder(
                borderColor: colorScheme.inverseSurface,
                iconPadding: 2,
                child: AssetImageWidget(
                  asset: icUser,
                  height: appDimen.dimen(20),
                ),
              ),
              Text(
                "Guest Login",
                style: textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _signUpAuth(BuildContext context){
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: IconButtonWidget.withCircularBorder(
            borderColor: colorScheme.inverseSurface,
            child: AssetImageWidget(
              asset: icApple,
              height: appDimen.dimen(20),
            ),
          ),
        ),
        SizedBox(width: appDimen.dimen(20)),
        Flexible(
          child: IconButtonWidget.withCircularBorder(
            borderColor: colorScheme.inverseSurface,
            child: AssetImageWidget(
              asset: icGoogle,
              height: appDimen.dimen(20),
            ),
          ),
        ),
        SizedBox(width: appDimen.dimen(20)),
        Flexible(
          child: IconButtonWidget.withCircularBorder(
            borderColor: colorScheme.inverseSurface,
            child: AssetImageWidget(
              asset: icFacebook,
              height: appDimen.dimen(20),
            ),
          ),
        ),
      ],
    );
  }
}
