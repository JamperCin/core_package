import 'package:core_module/core/model/local/base_object.dart';

class LocationSearchModel extends BaseObject {
  final String placeId;
  final String description;
  final String address;
  final double latitude;
  final double longitude;

  LocationSearchModel({
    this.placeId = '',
    this.description = '',
    this.address = '',
    this.latitude = 0.0,
    this.longitude = 0.0,
  });

  LocationSearchModel copyWith({
    String? placeId,
    String? description,
    String? address,
    double? latitude,
    double? longitude,
  }) {
    return LocationSearchModel(
      placeId: placeId ?? this.placeId,
      description: description ?? this.description,
      address: address ?? this.address,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }


  static LocationSearchModel fromJson(Map<String, dynamic> json) {
    return LocationSearchModel(
      placeId: json['placeId'] as String? ?? '',
      description: json['description'] as String? ?? '',
      address: json['address'] as String? ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
