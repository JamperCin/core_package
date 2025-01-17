import 'package:core_module/core/app/app_dimens.dart';
import 'package:core_module/core/db/app_preference.dart';
import 'package:core_module/core/res/config/configuration.dart';
import 'package:core_module/core/utils/navigation_utils.dart';
import 'package:core_module/core/utils/number_utils.dart';
import 'package:core_module/core/utils/validation_utils.dart';
import 'package:core_module/core_ui/snippets/places_search/geo_location_helper.dart';
import 'package:core_module/core_ui/snippets/snack_bar_snippet.dart';
import 'package:get/get.dart';

///Define global accessible variables
late AppDimens appDimen;
late NavUtils navUtils;
late AppPreference appPreference;
late GeoLocationHelper geoLocationHelper;
late NumberUtils numberUtils;
late ValidationUtils validationUtils;
late SnackBarSnippet snackBarSnippet;
late Configuration config;
RxBool isGuestUser = false.obs;
