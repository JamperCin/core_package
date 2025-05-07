// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CountryModel _$CountryModelFromJson(Map<String, dynamic> json) {
  return _CountryModel.fromJson(json);
}

/// @nodoc
mixin _$CountryModel {
  @JsonKey(name: 'e164_cc')
  String get phoneCode => throw _privateConstructorUsedError;
  String? get nameLocalized => throw _privateConstructorUsedError;
  @JsonKey(name: 'iso2_cc')
  String get countryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'e164_sc')
  int get e164Sc => throw _privateConstructorUsedError;
  @JsonKey(name: 'geographic')
  bool get geographic => throw _privateConstructorUsedError;
  @JsonKey(name: 'level')
  int get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'example')
  String get example => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name')
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_example_with_plus_sign')
  String? get fullExampleWithPlusSign => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name_no_e164_cc')
  String get displayNameNoCountryCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'e164_key')
  String get e164Key => throw _privateConstructorUsedError;

  /// Serializes this CountryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryModelCopyWith<CountryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryModelCopyWith<$Res> {
  factory $CountryModelCopyWith(
          CountryModel value, $Res Function(CountryModel) then) =
      _$CountryModelCopyWithImpl<$Res, CountryModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'e164_cc') String phoneCode,
      String? nameLocalized,
      @JsonKey(name: 'iso2_cc') String countryCode,
      @JsonKey(name: 'e164_sc') int e164Sc,
      @JsonKey(name: 'geographic') bool geographic,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'example') String example,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'full_example_with_plus_sign')
      String? fullExampleWithPlusSign,
      @JsonKey(name: 'display_name_no_e164_cc') String displayNameNoCountryCode,
      @JsonKey(name: 'e164_key') String e164Key});
}

/// @nodoc
class _$CountryModelCopyWithImpl<$Res, $Val extends CountryModel>
    implements $CountryModelCopyWith<$Res> {
  _$CountryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneCode = null,
    Object? nameLocalized = freezed,
    Object? countryCode = null,
    Object? e164Sc = null,
    Object? geographic = null,
    Object? level = null,
    Object? name = null,
    Object? example = null,
    Object? displayName = null,
    Object? fullExampleWithPlusSign = freezed,
    Object? displayNameNoCountryCode = null,
    Object? e164Key = null,
  }) {
    return _then(_value.copyWith(
      phoneCode: null == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      nameLocalized: freezed == nameLocalized
          ? _value.nameLocalized
          : nameLocalized // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      e164Sc: null == e164Sc
          ? _value.e164Sc
          : e164Sc // ignore: cast_nullable_to_non_nullable
              as int,
      geographic: null == geographic
          ? _value.geographic
          : geographic // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      fullExampleWithPlusSign: freezed == fullExampleWithPlusSign
          ? _value.fullExampleWithPlusSign
          : fullExampleWithPlusSign // ignore: cast_nullable_to_non_nullable
              as String?,
      displayNameNoCountryCode: null == displayNameNoCountryCode
          ? _value.displayNameNoCountryCode
          : displayNameNoCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      e164Key: null == e164Key
          ? _value.e164Key
          : e164Key // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryModelImplCopyWith<$Res>
    implements $CountryModelCopyWith<$Res> {
  factory _$$CountryModelImplCopyWith(
          _$CountryModelImpl value, $Res Function(_$CountryModelImpl) then) =
      __$$CountryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'e164_cc') String phoneCode,
      String? nameLocalized,
      @JsonKey(name: 'iso2_cc') String countryCode,
      @JsonKey(name: 'e164_sc') int e164Sc,
      @JsonKey(name: 'geographic') bool geographic,
      @JsonKey(name: 'level') int level,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'example') String example,
      @JsonKey(name: 'display_name') String displayName,
      @JsonKey(name: 'full_example_with_plus_sign')
      String? fullExampleWithPlusSign,
      @JsonKey(name: 'display_name_no_e164_cc') String displayNameNoCountryCode,
      @JsonKey(name: 'e164_key') String e164Key});
}

/// @nodoc
class __$$CountryModelImplCopyWithImpl<$Res>
    extends _$CountryModelCopyWithImpl<$Res, _$CountryModelImpl>
    implements _$$CountryModelImplCopyWith<$Res> {
  __$$CountryModelImplCopyWithImpl(
      _$CountryModelImpl _value, $Res Function(_$CountryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneCode = null,
    Object? nameLocalized = freezed,
    Object? countryCode = null,
    Object? e164Sc = null,
    Object? geographic = null,
    Object? level = null,
    Object? name = null,
    Object? example = null,
    Object? displayName = null,
    Object? fullExampleWithPlusSign = freezed,
    Object? displayNameNoCountryCode = null,
    Object? e164Key = null,
  }) {
    return _then(_$CountryModelImpl(
      phoneCode: null == phoneCode
          ? _value.phoneCode
          : phoneCode // ignore: cast_nullable_to_non_nullable
              as String,
      nameLocalized: freezed == nameLocalized
          ? _value.nameLocalized
          : nameLocalized // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      e164Sc: null == e164Sc
          ? _value.e164Sc
          : e164Sc // ignore: cast_nullable_to_non_nullable
              as int,
      geographic: null == geographic
          ? _value.geographic
          : geographic // ignore: cast_nullable_to_non_nullable
              as bool,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      example: null == example
          ? _value.example
          : example // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      fullExampleWithPlusSign: freezed == fullExampleWithPlusSign
          ? _value.fullExampleWithPlusSign
          : fullExampleWithPlusSign // ignore: cast_nullable_to_non_nullable
              as String?,
      displayNameNoCountryCode: null == displayNameNoCountryCode
          ? _value.displayNameNoCountryCode
          : displayNameNoCountryCode // ignore: cast_nullable_to_non_nullable
              as String,
      e164Key: null == e164Key
          ? _value.e164Key
          : e164Key // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CountryModelImpl implements _CountryModel {
  const _$CountryModelImpl(
      {@JsonKey(name: 'e164_cc') this.phoneCode = '',
      this.nameLocalized = '',
      @JsonKey(name: 'iso2_cc') this.countryCode = '',
      @JsonKey(name: 'e164_sc') this.e164Sc = -1,
      @JsonKey(name: 'geographic') this.geographic = false,
      @JsonKey(name: 'level') this.level = -1,
      @JsonKey(name: 'name') this.name = '',
      @JsonKey(name: 'example') this.example = '',
      @JsonKey(name: 'display_name') this.displayName = '',
      @JsonKey(name: 'full_example_with_plus_sign')
      this.fullExampleWithPlusSign,
      @JsonKey(name: 'display_name_no_e164_cc')
      this.displayNameNoCountryCode = '',
      @JsonKey(name: 'e164_key') this.e164Key = ''});

  factory _$CountryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CountryModelImplFromJson(json);

  @override
  @JsonKey(name: 'e164_cc')
  final String phoneCode;
  @override
  @JsonKey()
  final String? nameLocalized;
  @override
  @JsonKey(name: 'iso2_cc')
  final String countryCode;
  @override
  @JsonKey(name: 'e164_sc')
  final int e164Sc;
  @override
  @JsonKey(name: 'geographic')
  final bool geographic;
  @override
  @JsonKey(name: 'level')
  final int level;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'example')
  final String example;
  @override
  @JsonKey(name: 'display_name')
  final String displayName;
  @override
  @JsonKey(name: 'full_example_with_plus_sign')
  final String? fullExampleWithPlusSign;
  @override
  @JsonKey(name: 'display_name_no_e164_cc')
  final String displayNameNoCountryCode;
  @override
  @JsonKey(name: 'e164_key')
  final String e164Key;

  @override
  String toString() {
    return 'CountryModel(phoneCode: $phoneCode, nameLocalized: $nameLocalized, countryCode: $countryCode, e164Sc: $e164Sc, geographic: $geographic, level: $level, name: $name, example: $example, displayName: $displayName, fullExampleWithPlusSign: $fullExampleWithPlusSign, displayNameNoCountryCode: $displayNameNoCountryCode, e164Key: $e164Key)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryModelImpl &&
            (identical(other.phoneCode, phoneCode) ||
                other.phoneCode == phoneCode) &&
            (identical(other.nameLocalized, nameLocalized) ||
                other.nameLocalized == nameLocalized) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.e164Sc, e164Sc) || other.e164Sc == e164Sc) &&
            (identical(other.geographic, geographic) ||
                other.geographic == geographic) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.example, example) || other.example == example) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(
                    other.fullExampleWithPlusSign, fullExampleWithPlusSign) ||
                other.fullExampleWithPlusSign == fullExampleWithPlusSign) &&
            (identical(
                    other.displayNameNoCountryCode, displayNameNoCountryCode) ||
                other.displayNameNoCountryCode == displayNameNoCountryCode) &&
            (identical(other.e164Key, e164Key) || other.e164Key == e164Key));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      phoneCode,
      nameLocalized,
      countryCode,
      e164Sc,
      geographic,
      level,
      name,
      example,
      displayName,
      fullExampleWithPlusSign,
      displayNameNoCountryCode,
      e164Key);

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      __$$CountryModelImplCopyWithImpl<_$CountryModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CountryModelImplToJson(
      this,
    );
  }
}

abstract class _CountryModel implements CountryModel {
  const factory _CountryModel(
      {@JsonKey(name: 'e164_cc') final String phoneCode,
      final String? nameLocalized,
      @JsonKey(name: 'iso2_cc') final String countryCode,
      @JsonKey(name: 'e164_sc') final int e164Sc,
      @JsonKey(name: 'geographic') final bool geographic,
      @JsonKey(name: 'level') final int level,
      @JsonKey(name: 'name') final String name,
      @JsonKey(name: 'example') final String example,
      @JsonKey(name: 'display_name') final String displayName,
      @JsonKey(name: 'full_example_with_plus_sign')
      final String? fullExampleWithPlusSign,
      @JsonKey(name: 'display_name_no_e164_cc')
      final String displayNameNoCountryCode,
      @JsonKey(name: 'e164_key') final String e164Key}) = _$CountryModelImpl;

  factory _CountryModel.fromJson(Map<String, dynamic> json) =
      _$CountryModelImpl.fromJson;

  @override
  @JsonKey(name: 'e164_cc')
  String get phoneCode;
  @override
  String? get nameLocalized;
  @override
  @JsonKey(name: 'iso2_cc')
  String get countryCode;
  @override
  @JsonKey(name: 'e164_sc')
  int get e164Sc;
  @override
  @JsonKey(name: 'geographic')
  bool get geographic;
  @override
  @JsonKey(name: 'level')
  int get level;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'example')
  String get example;
  @override
  @JsonKey(name: 'display_name')
  String get displayName;
  @override
  @JsonKey(name: 'full_example_with_plus_sign')
  String? get fullExampleWithPlusSign;
  @override
  @JsonKey(name: 'display_name_no_e164_cc')
  String get displayNameNoCountryCode;
  @override
  @JsonKey(name: 'e164_key')
  String get e164Key;

  /// Create a copy of CountryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryModelImplCopyWith<_$CountryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
