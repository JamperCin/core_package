import 'package:core_module/core_module.dart';
import 'package:core_module_package/apple_screen.dart';
import 'package:core_module_package/bag_screen.dart';
import 'package:core_module_package/login_screen.dart';
import 'package:core_module_package/pick_up_screen.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';


class NewScreen extends BaseScreenStandard {


  @override
  Widget body(BuildContext context) {

    return Obx(() {
      BottomBarModel model = bottomBarMenuList.firstWhere((e) => e.isSelected == true);

      switch (model.text) {
        case "Apple":
          return AppleScreen();
        case "Bag":
          return BagScreen();
        case "PickUp":
          return PickUpScreen();
        case "Books":
          return LoginScreen();
        default:
          return LoginScreen();
      }
    });
  }



  ///List of menu for the bottom navigation bar
  RxList<BottomBarModel> bottomBarMenuList = [
    BottomBarModel(
      asset: icApple,
      text: 'Apple',
      isSelected: true,
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icBag,
      text: 'Bag',
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icPickUp,
      text: 'PickUp',
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
    BottomBarModel(
      asset: icProfileCircle,
      text: 'Books',
      iconSize: 26.dp(),
      key: GlobalKey<AnimatorWidgetState>(),
    ),
  ].obs;

  void onBottomMenuOnClick(BottomBarModel model) {
    var mod = bottomBarMenuList.firstWhere((e) => e.isSelected == true);
    if(mod == model) return;

    bottomBarMenuList.value = bottomBarMenuList.value
        .map((e) => e.copyWith(isSelected: e.text == model.text))
        .toList();

    mod = bottomBarMenuList.firstWhere((e) => e.isSelected == true);
    mod.key?.currentState?.forward();
  }

  @override
  Widget bottomNavigationBar(BuildContext context) {
    return CardContainerWidget(
      color: colorScheme.onSecondary,
      padding: EdgeInsets.only(
        bottom: appDimen.dimen(20),
        top: appDimen.dimen(8),
        right: appDimen.dimen(5),
        left: appDimen.dimen(5),
      ),
      margin: EdgeInsets.zero,
      elevation: 5,
      child: Obx(
            () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...bottomBarMenuList.value.map((model) {
                  return BottomAppBarWidget(
                    activeColor: colorScheme.secondary,
                    inActiveColor: colorScheme.primary,
                    model: model,
                    style: textTheme.labelMedium?.copyWith(fontSize: appDimen.dimen(10)),
                    onTap: () {
                      onBottomMenuOnClick(model);
                    },
                  );
                })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
