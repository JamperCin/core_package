import 'package:core_module/core_module.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class AppleScreen extends BaseScreenStandard {
  @override
  bool showAppBar() {
    return true;
  }

  @override
  Widget body(BuildContext context) {
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
          const TextFieldWidget(
            hintText: 'Enter First name',
            labelText: 'First name',
            // prefixAsset: icApple,
          ),
          Gap(20.dp()),
          TextFieldWidget.withPhoneNumber(
            hintText: 'Enter phone number',
            labelText: 'Phone Number',
            hasCountryPicker: true,
            defaultCountryCode: 'GH',
            countryPickerDecorationStyle:
                CountryPickerDecorationStyle.continuous,
            onCountrySelected: (c) {
              debugPrint("Country -> ${c.toString()}");
              // navUtils.fireTarget(LoginScreen(), model: c);
            },
          ),
          Gap(20.dp()),
          TextFieldWidget.withPassword(
            hintText: 'Enter password',
            labelText: 'Password',
            suffixIcon: const SizedBox.shrink(),
            prefixIcon: const SizedBox.shrink(),
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
          const Gap(20),
          PinEntryWidget(
            // key: pinKey,
            boxDecor: false,
            codeLength: 6,
          ),
          const Gap(20),
          TextButtonWidget(
            onTap: () {
              pinKey.currentState?.clearPin();
              snackBarSnippet.snackBarSuccess("Success");
            },
            text: "Clear Pin",
          ),
          const Gap(20),
          Obx(
            () => ButtonWidget(
              isLoading: isLoadingMore.value,
              onTap: () async {
                // isLoadingMore.value = !isLoadingMore.value;
                // debugPrint("isLoadingMore -> ${isLoadingMore.value}");
                // await Future.delayed(const Duration(seconds: 5));
                // isLoadingMore.value = !isLoadingMore.value;
                // debugPrint("isLoadingMore 2-> ${isLoadingMore.value}");
                //
                // snackBarSnippet.snackBarToast(
                //   message: "Payment Successful",
                //   persistent: true,
                //   prefixIcon: Icons.info,
                // );

                BottomSheetWidget(
                  context: context,
                  child: ConfirmTransactionLayout(
                    //displayCancelButton: false,
                    title: "Confirm Payment",
                    subTitle:
                        'Are you sure you want to pay the amount stated below',
                    onTap: () {
                      snackBarSnippet.showCountdownSnackBar(
                        context,
                        message: "Payment Successful",
                      );
                    },
                  ),
                );
              },
              text: 'Confirm Payment',
            ),
          ),
          const Gap(20),
          const CardContainerWidget(child: Text("   data    ")),
          const Gap(20),
          CheckboxWidget(
            onChange: (v) {},
            text: "Check the Terms and Conditions",
          ),
          const Gap(20),
          const ContainerWidget(
            child: Text("Go to data"),
          ),
          const Gap(20),
          DropDownWidget<String>(
            list: test,
            initialItem: test[2],
            onItemSelected: (v) {
              snackBarSnippet.showCountdownSnackBar(context, message: v);
            },
          ),
          const Gap(20),
          IconButtonWidget.withBorder(),
          const Gap(20),
          IconTextWidget(
            text:
                "show Loader is it good to be a citen of Ghana is always good to serve the lord and get good grades",
            onTap: () {
              const LoaderWidget()
                  .showProgressIndicator(context: context, timeOut: 3);
            },
          ),
          const Gap(20),
          const SmallButtonWidget(),
          const Gap(20),
          QuantityUpdateWidget(
            onTap: (q) {
              print("Quantity -> $q");
            },
          ),
          const Gap(20),
          TabBarWidget(
            tabs: const [
              Tab(
                //icon: Icon(Icons.ac_unit_outlined),
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
          const Gap(20),
          ProfileMenuWidget(
            onTap: () {
              currentPodIndex.value = currentPodIndex.value + 1;
            },
            text: "Profile",
            asset: icPickUp,
          ),
          const Gap(20),
          PodWidget(
            podLength: 4,
            currentIndex: currentPodIndex,
          ),
          const Gap(20),
          DayMonthPickerWidget(
            dayCtrl: TextEditingController(),
            monthCtrl: TextEditingController(),
          ),
          const Gap(20),
          DecoratedContainerWidget(
            height: 100.dp(),
            child: const Center(child: Text("   data    ")),
          ),
          const Gap(20),
          FileImagePickerWidget(
            apiParser: (json) => json['data']["url"] as String,
            url:
                "https://images.unsplash.com/photo-1494790108377-be9c29b29330?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  String appBarTitle() {
    return "Apple Screen";
  }

  final GlobalKey<PinEntryWidgetState> pinKey = GlobalKey();
  RxInt currentPodIndex = 0.obs;

  void clearPinMethod() {
    pinKey.currentState?.clearPin();
  }

  RxBool isLoadingMore = false.obs;

  final list = [
    const IntroModel(mainText: "2025"),
    const IntroModel(mainText: "2024"),
    const IntroModel(mainText: "2023"),
  ];

  final test = ["Nissan", "Toyata", "Benz", "Bugatti"];
}
