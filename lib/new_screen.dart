import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core/res/assets_path.dart';
import 'package:core_module/core/services/file_upload_service/file_upload_api_services.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/snippets/file_image_picker/file_image_picker_widget.dart';
import 'package:core_module/core_ui/snippets/places_search/places_picker_widget.dart';
import 'package:core_module/core_ui/widgets/button_switch_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/calendar_picker_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/container_widget.dart';
import 'package:core_module/core_ui/widgets/drop_down_widget.dart';
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
              CalendarPickerWidget.show(context: context,onSelectDate: (date){
                debugPrint("Date -> $date");
              },);
            },
            text: "Intro Screen",
          ),
          CalendarPickerWidget(),
          FileImagePickerWidget(
            // parser: (file) async{
            //   final upload =  FileUploadApiService().uploadFile<String>(
            //     file,
            //     parser: (json) {
            //       return json['data']["url"] as String;
            //     },
            //   );
            //
            //   return upload;
            // },
            apiParser: (json) => json['data']["url"] as String,
            url:
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
          ),
          CheckboxWidget(
            onChange: (v) {},
            text: "Check the Terms and Conditions",
          ),
          TextFieldWidget(
            hintText: 'Enter password',
            labelText: 'Password',
            maxLength: 10,
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
          // SizedBox(height: 20),
          // ShimmerWidget.withGrid(),
          SizedBox(height: 20),
          ButtonSwitchWidget.withOutline(
            items: [
              DictionaryModel(key: "Phone", value: "Phone", selected: true),
              DictionaryModel(key: "Email", value: "Email"),
            ].obs,
          )
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
