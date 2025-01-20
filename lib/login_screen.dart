import 'package:core_module/core/app/app_module_colors.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/res/assets_image_path.dart';
import 'package:core_module/core_ui/base_screen/base_screen_dec.dart';
import 'package:core_module/core_ui/snippets/third_party_auth/third_party_auth_widget.dart';
import 'package:core_module/core_ui/widgets/button_widget.dart';
import 'package:core_module/core_ui/widgets/divider_widget.dart';
import 'package:core_module/core_ui/widgets/loader_widget.dart';
import 'package:core_module/core_ui/widgets/text_button_widget.dart';
import 'package:core_module/core_ui/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class LoginScreen extends BaseScreenDecorated {
  //final _controller = Get.put(LoginController());

  @override
  String decoPageAsset() {
    return icProfileCircle;
  }

  @override
  Widget page(BuildContext context) {
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
  }
}
