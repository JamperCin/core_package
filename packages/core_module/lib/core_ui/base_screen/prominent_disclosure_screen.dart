import 'package:flutter/material.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/disclosure_model.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';

class ProminentDisclosureScreen extends BaseScreenStandard {
  final DisclosureModel model;

  @override
  bool showAppBar() {
    return true;
  }

  ProminentDisclosureScreen({required this.model});

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: appDimen.dimen(20),
        horizontal: appDimen.dimen(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ContainerWidget.withCircular(
            padding: EdgeInsets.all(appDimen.dimen(20)),
            radius: appDimen.dimen(180),
            child: AssetImageWidget(
              asset: model.asset ?? '',
              height: appDimen.dimen(50),
            ),
          ),
          SizedBox(height: appDimen.dimen(30)),
          Center(
            child: Text(
              model.title ?? '',
              style: textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: appDimen.dimen(1)),
          Center(
            child: Text(
              model.subTitle ?? '',
              style:
                  textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: appDimen.dimen(80)),
          ButtonWidget(onTap: model.onTap, text: model.buttonTitle ?? ''),
          SizedBox(height: appDimen.dimen(20)),
          Center(
            child: Text(
              model.buttonSubTitle ?? '',
              style: textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
