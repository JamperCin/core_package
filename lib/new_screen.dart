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
  bool showAppBar() {
    return true;
  }

  @override
  Color appBarBackgroundColor(BuildContext context) {
    return Colors.green;
  }

  @override
  String appBarTitle() {
    return "New Screen Tested Here";
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

  final list = [
    IntroModel(mainText: "2025"),
    IntroModel(mainText: "2024"),
    IntroModel(mainText: "2023"),
  ];
}
