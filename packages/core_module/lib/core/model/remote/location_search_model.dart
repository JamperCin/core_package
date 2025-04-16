import 'package:core_module/core/model/local/base_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_search_model.freezed.dart';
part 'location_search_model.g.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]
///
@freezed
class LocationSearchModel extends BaseObject with _$LocationSearchModel {
  const factory LocationSearchModel({
    @Default('') String placeId,
    @Default('') String description,
    @Default('') String address,
    @Default(0.0) double latitude,
    @Default(0.0) double longitude,
}) = _LocationSearchModel;

  factory LocationSearchModel.fromJson(Map<String, dynamic> json) =>
      _$LocationSearchModelFromJson(json);
}
