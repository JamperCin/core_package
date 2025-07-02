import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/extensions/int_extension.dart';
import 'package:core_module/core/model/local/dictionary_model.dart';
import 'package:core_module/core/model/local/intro_model.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_standard.dart';
import 'package:core_module/core_ui/snippets/file_image_picker/file_image_picker_widget.dart';
import 'package:core_module/core_ui/widgets/button_switch_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/calendar_picker_widget.dart';
import 'package:core_module/core_ui/widgets/checkbox_widget.dart';
import 'package:core_module/core_ui/widgets/drop_down_widget.dart';
import 'package:core_module/core_ui/widgets/tab_bar_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module/core_ui/widgets/shimmer_widget.dart';
import 'package:core_module_package/login_screen.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class NewScreen extends BaseScreenStandard {
  RxInt currentPodIndex = 0.obs;

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
  BaseObject getModel() {
    return super.getModel();
  }

  RxBool isLoadingMore = false.obs;

  @override
  Widget body(BuildContext context) {
    debugPrint("Argument --> ${Get.arguments}");

    return SingleChildScrollView(
      padding: EdgeInsets.all(24.dp()),
      child: Column(
        children: [
          Text(
            "New page here",
            style: textTheme.bodyMedium,
          ),
          ButtonSwitchWidget(
            list: [
              DictionaryModel(
                  key: "Light", value: "Light Mode", selected: true),
              DictionaryModel(key: "Dark", value: "Dark Mode"),
            ],
            onTap: (d) {
              isDarkMode.value = d.key == "Dark";
            },
          ),
          ShimmerWidget.withList(length: 1),
          Gap(20.dp()),
          TextFieldWidget(
            hintText: 'Enter First name',
            labelText: 'First name',
            // prefixAsset: icApple,
          ),
          Gap(20.dp()),
          TextFieldWidget.withPhoneNumber(
            hintText: 'Enter phone number',
            labelText: 'Phone Number',
            hasCountryPicker: true,
            onCountrySelected: (c) {
              navUtils.fireTarget(LoginScreen(), model: c);
            },
          ),
          Gap(20.dp()),
          TextFieldWidget.withPassword(
            hintText: 'Enter password',
            labelText: 'Password',
          ),
          Gap(20.dp()),
          TextButtonWidget.withTextOnly(
            onTap: () {
              CalendarPickerWidget.show(
                context: context,
                onSelectDate: (date) {
                  debugPrint("Date -> $date");
                },
              );
            },
            text: "show Calendar",
          ),
          //  CalendarPickerWidget(),
          Obx(
            () => ButtonWidget(
              isLoading: isLoadingMore.value,
              onTap: () async {
                isLoadingMore.value = !isLoadingMore.value;
                debugPrint("isLoadingMore -> ${isLoadingMore.value}");
                await Future.delayed(const Duration(seconds: 5));
                isLoadingMore.value = !isLoadingMore.value;
                debugPrint("isLoadingMore 2-> ${isLoadingMore.value}");

                snackBarSnippet.snackBarToast(
                  message: "Payment Successful",
                  persistent: true,
                  prefixIcon: Icons.info,
                );

                /* BottomSheetWidget(
                  context: context,
                  child: ConfirmTransactionLayout(
                    //displayCancelButton: false,
                    title: "Confirm Payment",
                    subTitle:
                        'Are you sure you want to pay the amount stated below',
                    onTap: () {
                      snackBarSnippet.showCountdownSnackBar(context,
                          message: "Payment Successful", );
                    },
                  ),
                );*/
              },
              text: 'Confirm Payment',
            ),
          ),
          Gap(20),
          TextButtonWidget(
            onTap: () {},
            text: "show loader",
          ),
          Gap(20),
          CardContainerWidget(child: Text("   data    ")),
          Gap(20),
          CheckboxWidget(
            onChange: (v) {},
            text: "Check the Terms and Conditions",
          ),
          Gap(20),
          ContainerWidget(
            child: Text("Go to data"),
          ),
          Gap(20),
          DropDownWidget<String>(
            list: test,
            initialItem: test[2],
            onItemSelected: (v) {
              snackBarSnippet.showCountdownSnackBar(context, message: v);
            },
          ),
          Gap(20),
          IconButtonWidget.withBorder(),
          Gap(20),
          IconTextWidget(
            text:
                "show Loader is it good to be a citen of Ghana is always good to serve the lord and get good grades",
            onTap: () {
              LoaderWidget()
                  .showProgressIndicator(context: context, timeOut: 3);
            },
          ),
          Gap(20),
          SmallButtonWidget(),
          Gap(20),
          QuantityUpdateWidget(
            onTap: (q) {
              print("Quantity -> $q");
            },
          ),
          Gap(20),
          PinEntryWidget(),
          Gap(20),
          TabBarWidget(
            tabs: const [
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
          Gap(20),
          ProfileMenuWidget(
            onTap: () {
              currentPodIndex.value = currentPodIndex.value + 1;
            },
            text: "Profile",
            asset: icPickUp,
          ),
          Gap(20),
          PodWidget(
            podLength: 4,
            currentIndex: currentPodIndex,
          ),
          Gap(20),
          DayMonthPickerWidget(
            dayCtrl: TextEditingController(),
            monthCtrl: TextEditingController(),
          ),
          Gap(20),
          DecoratedContainerWidget(
            height: 100.dp(),
            child: Center(child: Text("   data    ")),
          ),
          Gap(20),
          FileImagePickerWidget(
            apiParser: (json) => json['data']["url"] as String,
            url:
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
          ),
          /* ,


          TextFieldWidget(
            hintText: 'Enter password',
            labelText: 'Password',
            maxLength: 10,
          ),
          const SizedBox(height: 20),

          const SizedBox(height: 20),
          DropDownWidget<IntroModel>(
            selectedItem: list.first.obs,
            list: list,
            builder: (v) {
              return Text(v.mainText);
            },
          ),
          const SizedBox(height: 20),
          ButtonWidget.withOutLine(
            onTap: () {
              // PlacesPickerWidget.searchPlaces(
              //     context: context,
              //     onSearch: (loc) {
              //       print("Loc -> ${loc.toJson().toString()}");
              //     });
            },
            text: "Click me",
          ),
          // SizedBox(height: 20),
          // ShimmerWidget.withGrid(),*/
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  final list = [
    const IntroModel(mainText: "2025"),
    const IntroModel(mainText: "2024"),
    const IntroModel(mainText: "2023"),
  ];

  final test = ["Nissan", "Toyata", "Benz", "Bugatti"];
}
