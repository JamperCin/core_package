import 'package:core_module/core/model/remote/location_search_model.dart';

abstract class LocationApiInterface {
  Future<List<LocationSearchModel>> fetchSuggestions(String input);
  Future<LocationSearchModel> getPlaceDetailFromId(
      LocationSearchModel suggestion);
}
