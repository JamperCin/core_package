library core_module;

import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/db/app_preference.dart';
import 'package:core_module/core/def/global_definitions.dart';
import 'package:core_module/core/res/config/configuration.dart';
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
  ///Initialise the necessarily utilities and services
  Future<void> init(
    BuildContext context, {
    String? envPath,
  }) async {
    appDimen = AppDimens(context);
    appPreference = AppPreference();
    await appPreference.initPreference();
    //set up configuration file
    if (envPath != null) {
      config = Configuration(envPath: envPath);
    }
    //navUtils = NavUtils();
    snackBarSnippet = SnackBarSnippet();
    numberUtils = NumberUtils();
    validationUtils = ValidationUtils();
    geoLocationHelper = GeoLocationHelper();
  }
}
