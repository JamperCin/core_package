import 'package:core_module/core/model/local/base_object.dart';
import 'package:core_module/core/model/remote/delivery_mode_model.dart';
import 'package:core_module/core/model/remote/location_search_model.dart';

class DeliveryAddressModel extends BaseObject {
  final LocationSearchModel? location;
  final DeliveryModeModel? deliveryMode;
  final String id;
  final String fullName;
  final String phoneNumber;
  final bool selected;

  DeliveryAddressModel({
    this.location,
    this.deliveryMode,
    this.id = '',
    this.fullName = '',
    this.phoneNumber = '',
    this.selected = false,
  });

  DeliveryAddressModel copyWith({
    LocationSearchModel? location,
    DeliveryModeModel? deliveryMode,
    String? id,
    String? fullName,
    String? phoneNumber,
    bool? selected,
  }) {
    return DeliveryAddressModel(
      location: location ?? this.location,
      deliveryMode: deliveryMode ?? this.deliveryMode,
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      selected: selected ?? this.selected,
    );
  }

  static DeliveryAddressModel fromJson(Map<String, dynamic> json) {
    return DeliveryAddressModel(
      location: json['location'] == null
          ? LocationSearchModel()
          : LocationSearchModel.fromJson(
              json['location'] as Map<String, dynamic>),
      deliveryMode: json['deliveryMode'] == null
          ? DeliveryModeModel()
          : DeliveryModeModel.fromJson(
              json['deliveryMode'] as Map<String, dynamic>),
      id: json['id'] as String? ?? "",
      fullName: json['fullName'] as String? ?? "",
      phoneNumber: json['phoneNumber'] as String? ?? "",
      selected: json['selected'] as bool? ?? false,
    );
  }
}
