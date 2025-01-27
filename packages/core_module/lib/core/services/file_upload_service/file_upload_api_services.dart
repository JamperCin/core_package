import 'dart:io';

import 'package:core_module/core/services/base_api_service.dart';
import 'package:core_module/core/services/file_upload_service/file_upload_api_interface.dart';
import 'package:http_parser/src/media_type.dart';

class FileUploadApiService extends BaseApiService
    implements FileUploadApiInterface {
  static FileUploadApiService? _apiService;

  FileUploadApiService._();

  factory FileUploadApiService() {
    return _apiService ??= FileUploadApiService._();
  }

  @override
  Future<String> uploadFile<T>(
    File file, {
    MediaType? mediaType,
    String? host,
    String? api,
    T Function(dynamic)? parser,
  }) async {
    final url = await _apiService?.postMultiPartRequest<String>(
          api: api ?? 'prime.sika/v1/upload-file?',
          file: file,
          host: host,
          parser: (json) {
            return json['data']['url'] as String;
          },
        ) ??
        "";

    return url;
  }
}
