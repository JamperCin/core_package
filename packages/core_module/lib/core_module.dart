library core_module;

import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/db/app_db_preference.dart';
import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core/res/config/configuration.dart';
import 'package:core_module/core/utils/navigation_utils.dart';
import 'package:core_module/core/utils/number_utils.dart';
import 'package:core_module/core/utils/validation_utils.dart';
import 'package:core_module/core_ui/snippets/places_search/geo_location_helper.dart';
import 'package:core_module/core_ui/snippets/snack_bar_snippet.dart';
import 'package:flutter/cupertino.dart';
export 'package:get/get.dart';
export 'package:uuid/uuid.dart';
export 'package:carousel_slider/carousel_slider.dart';
export 'package:shared_preferences/shared_preferences.dart';

class CoreModule {
  static CoreModule? _instance;

  CoreModule._();

  factory CoreModule() {
    return _instance ??= CoreModule._();
  }

  ///Initialise the necessarily utilities and services
  Future<void> init({
    BuildContext? context,
    String? envPath,
    EnvType? defaultEnv,
    bool askLocationPermission = false,
    String? loginScreen,
    String? homePageScreen,
  }) async {
    if (context != null) {
      appDimen = AppDimens(context);
    }
    appDbPreference = AppDbPreference();
    await appDbPreference.initPreference();
    //set up configuration file
    if (envPath != null) {
      config = Configuration(envPath: envPath,defaultEnv: defaultEnv);
    }
    navUtils = NavUtils(loginScreen: loginScreen, homePage: homePageScreen);
    snackBarSnippet = SnackBarSnippet();
    numberUtils = NumberUtils();
    validationUtils = ValidationUtils();
    geoLocationHelper = GeoLocationHelper(askPermission: askLocationPermission);
  }
}
