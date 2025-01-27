import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module_package/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IntroController extends GetxController {
  final pageIndex = 0.obs;
  final lastPage = false.obs;

  final introData = [
    const IntroModel(
      mainText: 'Connect, Access and Get Informed',
      subText:
          'Stay connected with the vibrant community of students across Ghana. Access resources, updates, and initiatives designed to empower students nationwide.',
      assetName: icSuccess,
    ),
    const IntroModel(
      assetName: icPickUp,
      mainText: 'Support Through Giving',
      subText: ' Make a difference by contributing to our projects. Easily donate through the app and help us build a stronger future for students.',
    ),
    const IntroModel(
      mainText: 'Spreading Faith and Hope',
      subText:
          ' Join us in sharing the message of God. Access inspirational content and become part of a mission to uplift and encourage others.',
      assetName: icBag,
    ),
    const IntroModel(
      mainText: 'Start Your Day with Devotion',
      subText:
      'Begin each day with guided devotions and scripture reflections to keep you spiritually grounded and motivated.',
      assetName: icFavorite,
    ),
  ];

  void onPageChanged(int newIndex) {
    pageIndex.value = newIndex;
    lastPage.value = newIndex == introData.length - 1;
  }

  void onGoToNext(PageController pageController) {
    if (lastPage.value) {
      onSkipOnClick();
      return;
    }
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void onGoToPrevious(PageController pageController) {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
    );
  }

  void onSkipOnClick() {
    navUtils.fireTargetOff(LoginScreen());
   // appDbPreference.setBool(appDbPreference.IS_INTRO_SHOWN, true);
  }
}
