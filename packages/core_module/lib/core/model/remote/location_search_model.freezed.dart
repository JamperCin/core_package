// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_search_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationSearchModel _$LocationSearchModelFromJson(Map<String, dynamic> json) {
  return _LocationSearchModel.fromJson(json);
}

/// @nodoc
mixin _$LocationSearchModel {
  String get placeId => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  double get latitude => throw _privateConstructorUsedError;
  double get longitude => throw _privateConstructorUsedError;

  /// Serializes this LocationSearchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationSearchModelCopyWith<LocationSearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationSearchModelCopyWith<$Res> {
  factory $LocationSearchModelCopyWith(
          LocationSearchModel value, $Res Function(LocationSearchModel) then) =
      _$LocationSearchModelCopyWithImpl<$Res, LocationSearchModel>;
  @useResult
  $Res call(
      {String placeId,
      String description,
      String address,
      double latitude,
      double longitude});
}

/// @nodoc
class _$LocationSearchModelCopyWithImpl<$Res, $Val extends LocationSearchModel>
    implements $LocationSearchModelCopyWith<$Res> {
  _$LocationSearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_value.copyWith(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationSearchModelImplCopyWith<$Res>
    implements $LocationSearchModelCopyWith<$Res> {
  factory _$$LocationSearchModelImplCopyWith(_$LocationSearchModelImpl value,
          $Res Function(_$LocationSearchModelImpl) then) =
      __$$LocationSearchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String placeId,
      String description,
      String address,
      double latitude,
      double longitude});
}

/// @nodoc
class __$$LocationSearchModelImplCopyWithImpl<$Res>
    extends _$LocationSearchModelCopyWithImpl<$Res, _$LocationSearchModelImpl>
    implements _$$LocationSearchModelImplCopyWith<$Res> {
  __$$LocationSearchModelImplCopyWithImpl(_$LocationSearchModelImpl _value,
      $Res Function(_$LocationSearchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? placeId = null,
    Object? description = null,
    Object? address = null,
    Object? latitude = null,
    Object? longitude = null,
  }) {
    return _then(_$LocationSearchModelImpl(
      placeId: null == placeId
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocationSearchModelImpl implements _LocationSearchModel {
  const _$LocationSearchModelImpl(
      {this.placeId = '',
      this.description = '',
      this.address = '',
      this.latitude = 0.0,
      this.longitude = 0.0});

  factory _$LocationSearchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationSearchModelImplFromJson(json);

  @override
  @JsonKey()
  final String placeId;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String address;
  @override
  @JsonKey()
  final double latitude;
  @override
  @JsonKey()
  final double longitude;

  @override
  String toString() {
    return 'LocationSearchModel(placeId: $placeId, description: $description, address: $address, latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationSearchModelImpl &&
            (identical(other.placeId, placeId) || other.placeId == placeId) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, placeId, description, address, latitude, longitude);

  /// Create a copy of LocationSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationSearchModelImplCopyWith<_$LocationSearchModelImpl> get copyWith =>
      __$$LocationSearchModelImplCopyWithImpl<_$LocationSearchModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationSearchModelImplToJson(
      this,
    );
  }
}

abstract class _LocationSearchModel implements LocationSearchModel {
  const factory _LocationSearchModel(
      {final String placeId,
      final String description,
      final String address,
      final double latitude,
      final double longitude}) = _$LocationSearchModelImpl;

  factory _LocationSearchModel.fromJson(Map<String, dynamic> json) =
      _$LocationSearchModelImpl.fromJson;

  @override
  String get placeId;
  @override
  String get description;
  @override
  String get address;
  @override
  double get latitude;
  @override
  double get longitude;

  /// Create a copy of LocationSearchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationSearchModelImplCopyWith<_$LocationSearchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
