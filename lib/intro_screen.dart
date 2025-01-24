import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core_ui/widgets/asset_image_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/icon_button_widget.dart';
import 'package:core_module/core_ui/widgets/pod_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module_package/intro_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';

class IntroScreen extends BaseScreenStandard {
  final _introController = IntroController();
  final _pageController = PageController();

  @override
  bool safeArea() {
    return false;
  }

  @override
  Color backgroundColor(BuildContext context) {
    return Colors.white;
  }

  @override
  Widget body(BuildContext context) {
    return _normalIntroBody();
  }

  Widget _normalIntroBody() {
    return Padding(
      padding: EdgeInsets.only(
        left: appDimen.dimen(8),
        top: appDimen.dimen(5),
        right: appDimen.dimen(8),
        bottom: appDimen.dimen(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              itemCount: _introController.introData.length,
              onPageChanged: _introController.onPageChanged,
              scrollBehavior: const ScrollBehavior(
                  ),
              itemBuilder: (context, index) {
                IntroModel model = _introController.introData[index];

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AssetImageWidget(
                      asset: model.assetName,
                      height: appDimen.dimen(270),
                      width: appDimen.dimen(255),
                    ),
                    SizedBox(height: appDimen.dimen(10)),
                    Padding(
                      padding: EdgeInsets.only(
                          left: appDimen.dimen(10),
                          right: appDimen.dimen(10)),
                      child: Text(
                        model.mainText,
                        textAlign: TextAlign.center,
                        style: textTheme.displayLarge,
                      ),
                    ),
                    SizedBox(height: appDimen.dimen(20)),
                    Padding(
                      padding: EdgeInsets.only(
                          left: appDimen.dimen(10),
                          right: appDimen.dimen(10)),
                      child: Text(
                        model.subText,
                        style: textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: appDimen.dimen(8)),
          Obx(
            () =>  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_introController.pageIndex.value != 0)
                  IconButtonWidget.withCircularBorder(
                    iconSize: 20,
                    icon: Icons.arrow_back_ios,
                    iconColor: colorScheme.primary,
                    borderColor: Colors.transparent,
                    iconPadding: 2,
                    onTap: () {
                      _introController.onGoToPrevious(_pageController);
                    },
                  ),
                if (_introController.pageIndex.value != 0)
                  SizedBox(width: appDimen.dimen(10)),
                FittedBox(
                    child: PodWidget(
                      podLength: _introController.introData.length,
                      currentIndex: _introController.pageIndex,
                      onTap: (index) {
                        _pageController.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.decelerate,
                        );
                      },
                    )),
                SizedBox(width: appDimen.dimen(10)),
                IconButtonWidget.withCircularBorder(
                  icon: Icons.arrow_forward_ios,
                  iconSize: 20,
                  iconPadding: 2,
                  iconColor: colorScheme.primary,
                  borderColor: Colors.transparent,
                  onTap: () {
                    _introController.onGoToNext(_pageController);
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: appDimen.dimen(8)),
          TextButtonWidget(
            text: "Skip Now",
            onTap: _introController.onSkipOnClick,
          )
        ],
      ),
    );
  }
}




