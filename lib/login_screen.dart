import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core_module.dart';
import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:core_module/core_ui/snippets/third_party_auth/third_party_auth_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:core_module_package/res/app_colors.dart';
import 'package:core_module_package/res/res_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends BaseScreenWithTabs {


  @override
  String appBarTitle() {
    return "Devotions";
  }

  @override
  void onTap(int index) {
    super.onTap(index);
    debugPrint("on Tap --> $index");
  }

  @override
  void onPageSwiped(int index) {
    super.onPageSwiped(index);
    debugPrint("Tab changed to index: ${tabController.index}");
  }


  @override
  bool showAppBar() {
    return true;
  }

  @override
  int tabCount() {
    return 3;
  }

  @override
  List<Widget> tabs() {
    return [
      Tab(text: "Tab 1"),
      Tab(text: "Tab 2"),
      Tab(text: "Tab 3"),
    ];
  }

  @override
  List<Widget> tabsViews() {
    return [
      Center(child: Text('Content for Tab 1')),
      Center(child: Text('Content for Tab 2')),
      Center(child: Text('Content for Tab 3')),
    ];
  }

/* @override
  Widget page(BuildContext context) {

    debugPrint("Argument --> ${Get.arguments}");
    debugPrint("Argument 2. --> ${getModel().toString()}");

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: appDimen.dimen(20)),
          Text(
            'Log In',
            style: textTheme.headlineMedium,
          ),
          SizedBox(height: appDimen.dimen(20)),
          Text(
            'Log in to StudentUnion App with your email address and password',
            style: textTheme.labelSmall,
          ),
          SizedBox(height: appDimen.dimen(40)),
          TextFieldWidget(
            labelText: 'Email',
            hintText: 'Email Eg. example@gmail.com',
            prefixIcon: Icon(
              Icons.email_outlined,
              color: colorScheme.onPrimary,
              size: appDimen.dimen(18),
            ),
            keyboardType: TextInputType.emailAddress,
            // controller: _controller.emailTxtCtrl,
          ),
          SizedBox(height: appDimen.dimen(10)),
          TextFieldWidget.withPassword(
            labelText: 'Password',
            hintText: 'Enter your password',
            //controller: _controller.passwordTxtCtrl,
          ),
          SizedBox(height: appDimen.dimen(20)),
          Align(
            alignment: Alignment.centerRight,
            child: TextButtonWidget.withTextOnly(
              text: 'Forgot Password', onTap: () {},
              //onTap: _controller.onForgotPasswordClicked,
            ),
          ),
          SizedBox(height: appDimen.dimen(40)),
          ButtonWidget(
            asset: icApple,
            onTap: () async {
              await LoaderWidget().showProgressIndicator(context: context);
              await Future.delayed(const Duration(seconds: 3));
              LoaderWidget().hideProgress();

            },
            text: 'Login',
          ),
          SizedBox(height: appDimen.dimen(20)),
          const DividerWidget.withChild(text: 'Or'),
          SizedBox(height: appDimen.dimen(20)),
          const ThirdPartyAuthWidget(),
          SizedBox(height: appDimen.dimen(20)),
          Center(
            child: TextButtonWidget(
              onTap: () async {},
              child: RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: 'Don\'t have an Account? ',
                  style: textTheme.labelSmall,
                ),
                TextSpan(
                  text: 'Sign Up',
                  style:
                      textTheme.labelMedium?.copyWith(color: greenPrimaryColor),
                ),
              ])),
            ),
          ),
          SizedBox(height: appDimen.dimen(20)),
        ],
      ),
    );
  }*/
}
