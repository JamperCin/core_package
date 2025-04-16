// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaseResponseModelImpl _$$BaseResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BaseResponseModelImpl(
      success: json['success'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt() ?? 0,
      errorMsg: json['errorMsg'] as String?,
      error: json['error'] as String?,
      data: json['data'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$BaseResponseModelImplToJson(
        _$BaseResponseModelImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'status': instance.status,
      'errorMsg': instance.errorMsg,
      'error': instance.error,
      'data': instance.data,
    };
