// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      phoneCode: json['e164_cc'] as String? ?? '',
      nameLocalized: json['nameLocalized'] as String? ?? '',
      countryCode: json['iso2_cc'] as String? ?? '',
      e164Sc: (json['e164_sc'] as num?)?.toInt() ?? -1,
      geographic: json['geographic'] as bool? ?? false,
      selected: json['selected'] as bool? ?? false,
      level: (json['level'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      example: json['example'] as String? ?? '',
      displayName: json['display_name'] as String? ?? '',
      fullExampleWithPlusSign: json['full_example_with_plus_sign'] as String?,
      displayNameNoCountryCode:
          json['display_name_no_e164_cc'] as String? ?? '',
      e164Key: json['e164_key'] as String? ?? '',
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'e164_cc': instance.phoneCode,
      'nameLocalized': instance.nameLocalized,
      'iso2_cc': instance.countryCode,
      'e164_sc': instance.e164Sc,
      'geographic': instance.geographic,
      'selected': instance.selected,
      'level': instance.level,
      'name': instance.name,
      'example': instance.example,
      'display_name': instance.displayName,
      'full_example_with_plus_sign': instance.fullExampleWithPlusSign,
      'display_name_no_e164_cc': instance.displayNameNoCountryCode,
      'e164_key': instance.e164Key,
    };
