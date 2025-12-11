import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/enum/country_picker_type.dart';
import 'package:core_module/core/extensions/color_extension.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/snippets/file_image_picker/file_image_picker_widget.dart';
import 'package:core_module/core_ui/snippets/places_search/places_picker_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/drop_down_widget.dart';
import 'package:core_module/core_ui/widgets/pin_entry_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:core_module/core_ui/widgets/tab_bar_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module_package/intro_screen.dart';
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
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(24.dp()),
      child: Column(
        children: [
          Text(
            "New page here",
            style: textTheme.labelMedium,
          ),
          // ShimmerWidget.withList(length: 5),
          TextButtonWidget.withTextOnly(
            onTap: () {
              snackBarSnippet.showCountdownSnackBar(context,
                message: "Now we are ministering the widget tree",
                // showProgressIndicator: true,
              );
            },
            text: "Intro Scrren",
          ),
          FileImagePickerWidget(
            url:
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
          ),
          CheckboxWidget(
            checkColor: HexColor.fromHex("0D4A59"),
            onChange: (v) {
              debugPrint(
                  "COLOR ${HexColor.fromHex("0D4A59").getClosestColorName()}");
            },
            text: "Check the Terms and Conditions",
          ),
          TextFieldWidget.withPhoneNumber(
            hintText: 'Enter phone number',
            labelText: 'Phone Number',
            hasCountryPicker: true,
            countryWidgetHintText: "+1",
            countryPickerType: CountryPickerType.modalStyle,
            onCountrySelected: (c) {
              print("SE --- ${c?.toJson().toString()}");
            },
          ),
          SizedBox(height: 20),
          PinEntryWidget(
            onCodeSubmitted: (d) {
              print("Code is over here => $d");
            },
            codeLength: 6,
            boxDecor: false,
          ),
          SizedBox(height: 20),
          TabBarWidget(
            tabs: [
              Tab(
                // icon: Icon(Icons.ac_unit_outlined),
                text: "Summary",
              ),
              Tab(
                // icon: Icon(Icons.ac_unit_outlined),
                text: "Jobs",
              ),
              Tab(
                // icon: Icon(Icons.local_activity),
                text: "Description",
              )
            ],
            onTap: (int) {},
          ),
          SizedBox(height: 20),
          DropDownWidget<IntroModel>(
            selectedItem: list.first.obs,
            list: list,
            builder: (v) {
              return Text(v.mainText);
            },
          ),
          SizedBox(height: 20),
          ButtonWidget.withOutLine(
            onTap: () {
              PlacesPickerWidget.searchPlaces(
                  context: context,
                  onSearch: (loc) {
                    print("Loc -> ${loc.toJson().toString()}");
                  });
            },
            text: "Click me",
          ),
          SizedBox(height: 20),
          ShimmerWidget.withGrid(),
        ],
      ),
    );
  }
}
