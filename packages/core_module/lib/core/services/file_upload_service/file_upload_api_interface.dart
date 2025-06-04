import 'dart:io';

import 'package:http_parser/http_parser.dart';

abstract class FileUploadApiInterface {
  Future<T?> uploadFile<T>(
    File file, {
    MediaType? mediaType,
    String? host,
    String? api,
    T Function(dynamic)? parser,
  });
}
