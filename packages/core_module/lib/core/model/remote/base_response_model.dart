import 'package:core_module/core/model/local/base_object.dart';

class BaseResponseModel extends BaseObject {
  final bool success;
  final int status;
  final String? errorMsg;
  final String? error;
  final Map<String, dynamic>? data;

  BaseResponseModel({
    this.success = false,
    this.status = 0,
    this.errorMsg,
    this.error,
    this.data,
  });

  BaseResponseModel copyWith({
    bool? success,
    int? status,
    String? errorMsg,
    String? error,
    Map<String, dynamic>? data,
  }) {
    return BaseResponseModel(
      success: success ?? this.success,
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  static BaseResponseModel fromJson(Map<String, dynamic> json) {
    return BaseResponseModel(
      success: json['success'] as bool? ?? false,
      status: (json['status'] as num?)?.toInt() ?? 0,
      errorMsg: json['error_msg'] as String? ?? '',
      error: json['error'] as String? ?? '',
      data: json['data'] as Map<String, dynamic>? ?? const {},
    );
  }
}
