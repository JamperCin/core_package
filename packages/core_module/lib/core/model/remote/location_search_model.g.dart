// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationSearchModelImpl _$$LocationSearchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationSearchModelImpl(
      placeId: json['placeId'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$$LocationSearchModelImplToJson(
        _$LocationSearchModelImpl instance) =>
    <String, dynamic>{
      'placeId': instance.placeId,
      'description': instance.description,
      'address': instance.address,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
