import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_model.g.dart';

part 'country_model.freezed.dart';

///Run this command after any changes to any of the model files
///command @command [dart run build_runner build --delete-conflicting-outputs]

@freezed
class CountryModel with _$CountryModel {
  const factory CountryModel({
    @JsonKey(name: 'e164_cc') @Default('') String phoneCode,
    @Default('') String? nameLocalized,
    @JsonKey(name: 'iso2_cc') @Default('') String countryCode,
    @JsonKey(name: 'e164_sc') @Default(-1) int e164Sc,
    @JsonKey(name: 'geographic') @Default(false) bool geographic,
    @Default(false) bool selected,
    @JsonKey(name: 'level') @Default(-1) int level,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'example') @Default('') String example,
    @JsonKey(name: 'display_name') @Default('') String displayName,
    @JsonKey(name: 'full_example_with_plus_sign')
    String? fullExampleWithPlusSign,
    @JsonKey(name: 'display_name_no_e164_cc')
    @Default('')
    String displayNameNoCountryCode,
    @JsonKey(name: 'e164_key') @Default('') String e164Key,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, Object?> json) =>
      _$CountryModelFromJson(json);


  static CountryModel worldWide = const CountryModel(
    phoneCode: '',
    countryCode: 'WW',
    e164Sc: -1,
    geographic: false,
    level: -1,
    name: 'World Wide',
    example: '',
    displayName: 'World Wide (WW)',
    displayNameNoCountryCode: 'World Wide',
    e164Key: '',
  );
}
