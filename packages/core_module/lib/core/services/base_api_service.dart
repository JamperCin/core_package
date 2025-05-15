import 'dart:convert';
import 'dart:io';

import 'package:core_module/core/def/global_def.dart';
import 'package:core_module/core/enum/file_type.dart';
import 'package:core_module/core/utils/map_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class BaseApiService {
  Future<http.Response> _post(
    uri, {
    bool tokenHeader = true,
    bool multiPartHeader = false,
    param,
    Encoding? encoding,
    Map<String, String>? headers,
  }) async {
    debugPrint(
        "\nPOST REQUEST: $uri\nHEADERS: ${headers ?? (multiPartHeader ? _getMultiPartTokenHeaders() : (tokenHeader ? _getTokenHeaders() : _getHeaders()))} \nBODY : $param");
    return http.post(
      uri,
      body: param,
      encoding: encoding,
      headers: headers ??
          (multiPartHeader
              ? _getMultiPartTokenHeaders()
              : (tokenHeader ? _getTokenHeaders() : _getHeaders())),
    );
  }

  Future<http.Response> _get(
    uri, {
    bool tokenHeader = true,
    Map<String, String>? headers,
  }) async {
    debugPrint(
        "\nGET REQUEST: $uri\nHEADERS: ${headers ?? (tokenHeader ? _getTokenHeaders() : _getHeaders())}");
    return http.get(
      uri,
      headers: headers ?? (tokenHeader ? _getTokenHeaders() : _getHeaders()),
    );
  }

  Future<http.Response> _put(
    url, {
    bool tokenHeader = true,
    body,
    Encoding? encoding,
    Map<String, String>? headers,
  }) async {
    debugPrint(
        "$url, requestType: PUT, headers: ${headers ?? (tokenHeader ? _getTokenHeaders() : _getHeaders())}, params: $body");
    return http.put(
      url,
      body: body,
      encoding: encoding,
      headers: headers ?? (tokenHeader ? _getTokenHeaders() : _getHeaders()),
    );
  }

  Future<http.Response> _delete(
    url, {
    bool tokenHeader = true,
    body,
    Encoding? encoding,
    Map<String, String>? headers,
  }) async {
    debugPrint(
        "$url, requestType: DELETE, headers: ${headers ?? (tokenHeader ? _getTokenHeaders() : _getHeaders())}, params: $body");
    return http.delete(
      url,
      body: body,
      encoding: encoding,
      headers: headers ?? (tokenHeader ? _getTokenHeaders() : _getHeaders()),
    );
  }

  Future<http.StreamedResponse> _postMultipart({
    required File file,
    required Uri uri,
    MediaType? mediaType,
    Map<String, String>? headers,
  }) async {
    var request = http.MultipartRequest("POST", uri);
    request.headers.addAll(headers ?? _getMultiPartTokenHeaders());
    String fileName = "";
    if (mediaType == null || mediaType.type == "image") {
      fileName = "prime_customer${DateTime.now().millisecond}_img.jpg";
    } else {
      fileName = "prime_file${DateTime.now().millisecond}_doc.pdf";
    }

    request.files.add(
      http.MultipartFile(
        'file',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: fileName,
        contentType: mediaType ?? MediaType('image', 'jpg'),
      ),
    );

    debugPrint(request.url.toString());

    final stream = await request.send();
    return stream;
  }

  Future<Uri> _buildUrl(String url, {dynamic body, String? host}) async {
    return Uri(
      scheme: config.getEnvironmentScheme(),
      host: host ?? config.getEnvironment(),
      path: url.replaceAll("?", ""),
      queryParameters: body,
    );
  }

  Map<String, String> _getHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent("Content-type", () => "application/json");
    headers.putIfAbsent("da-secret", () => _getPlatformAccess());
    return headers;
  }

  Map<String, String> _getTokenHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent("da-secret", () => _getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "application/json");
    headers.putIfAbsent(isGuestUser.value ? "X-Guest-Token" : "Authorization",
        () => getToken());

    return headers;
  }

  Map<String, String> _getMultiPartTokenHeaders() {
    Map<String, String> headers = {};
    headers.putIfAbsent("da-secret", () => _getPlatformAccess());
    headers.putIfAbsent("Content-type", () => "multipart/form-data");
    headers.putIfAbsent(isGuestUser.value ? "X-Guest-Token" : "Authorization",
        () => getToken());

    return headers;
  }

  String _getPlatformAccess() {
    if (kIsWeb) {
      return "pCweb";
    }
    return Platform.isAndroid ? "pCdroid" : "pCios";
  }

  Future<T?> _serialiseResponse<T>({
    dynamic response,
    bool print = true,
    bool showToast = false,
    T Function(dynamic)? parser,
  }) async {
    try {
      dynamic json = {};
      if (response is String) {
        json = MapUtils().convertDecode(response);
      } else {
        json = MapUtils().convertDecode(response.body);
      }

      if (print) {
        debugPrint(
            "Response : $json\n --> Status Code : ${response.statusCode}");
      }

      bool success =
          json.containsKey('success') ? json['success'] as bool : false;

      if (response.statusCode == 200 || success) {
        if (parser != null) {
          return parser(json);
        }

        return json is Map
            ? parser != null
                ? parser(json as Map<String, dynamic>)
                : json as Map<String, dynamic>
            : parser != null
                ? parser(json)
                : json;
      } else {
        String error = getObject('error', json) ??
            getObject('error_msg', json) ??
            "An error occurred";
        if (showToast) {
          snackBarSnippet.snackBarError(error);
        }

        return null;
      }
    } catch (e) {
      debugPrint("Error $e");
      if (showToast) {
        snackBarSnippet
            .snackBarError("An error occurred. Please try again later");
      }
      return null;
    }
  }

  ///================ P U B L I C    M E T H O D S =======================

  dynamic getObject(String key, Map<String, dynamic> json) {
    return json.containsKey(key) ? json[key] : null;
  }

  String getToken() {
    return appDbPreference.getToken();
  }

  String guestUserHeader() {
    return 'X-Guest-Token';
  }

  ///Fetch list of items from the api using the GET method
  ///and retrieving the list from the 'data' param
  Future<List<T>> getListRequest<T>({
    required String api,
    required String key,
    String? objectKey,
    bool showToast = false,
    bool print = true,
    required T Function(Map<String, dynamic>) fromJson,
    Map<String, dynamic>? param,
  }) async {
    final results = await getRequest<List<T>>(
            api: api,
            param: param,
            print: print,
            showToast: showToast,
            parser: (json) {
              final listMap = json[objectKey ?? 'data'][key] as List;
              return [...listMap.map((e) => fromJson(e))];
            }) ??
        [];
    return results;
  }

  Future<T?> getRequest<T>({
    required String api,
    Map<String, dynamic>? param,
    bool tokenHeader = true,
    bool print = true,
    bool showToast = false,
    String? host,
    Map<String, String>? headers,
    T Function(dynamic)? parser,
  }) async {
    final uri = await _buildUrl(api, body: param, host: host);
    var response = await _get(uri, tokenHeader: tokenHeader, headers: headers);
    return _serialiseResponse<T>(
      response: response,
      parser: parser,
      print: print,
      showToast: showToast,
    );
  }

  Future<T?> postRequest<T>({
    required String api,
    Map<String, dynamic>? param,
    bool tokenHeader = true,
    bool print = true,
    bool showToast = false,
    String? host,
    Map<String, String>? headers,
    T Function(dynamic)? parser,
  }) async {
    final uri = await _buildUrl(api, host: host);
    var response = await _post(
      uri,
      tokenHeader: tokenHeader,
      headers: headers,
      param: param != null ? jsonEncode(param) : param,
    );
    return _serialiseResponse<T>(
      response: response,
      parser: parser,
      print: print,
      showToast: showToast,
    );
  }

  Future<T?> putRequest<T>({
    required String api,
    Map<String, dynamic>? param,
    bool tokenHeader = true,
    bool print = true,
    bool showToast = false,
    String? host,
    Map<String, String>? headers,
    T Function(dynamic)? parser,
  }) async {
    final uri = await _buildUrl(api, host: host);
    var response = await _put(
      uri,
      tokenHeader: tokenHeader,
      headers: headers,
      body: param != null ? jsonEncode(param) : param,
    );
    return _serialiseResponse<T>(
      response: response,
      parser: parser,
      print: print,
      showToast: showToast,
    );
  }

  Future<T?> deleteRequest<T>({
    required String api,
    Map<String, dynamic>? param,
    bool tokenHeader = true,
    bool showToast = false,
    bool print = true,
    String? host,
    Map<String, String>? headers,
    T Function(dynamic)? parser,
  }) async {
    final uri = await _buildUrl(api, host: host);
    var response = await _delete(
      uri,
      tokenHeader: tokenHeader,
      headers: headers,
      body: param != null ? jsonEncode(param) : param,
    );
    return _serialiseResponse<T>(
      response: response,
      parser: parser,
      print: print,
      showToast: showToast,
    );
  }

  Future<T?> postMultiPartRequest<T>({
    required String api,
    required File file,
    bool showToast = false,
    bool print = true,
    String? host,
    Map<String, String>? headers,
    T Function(dynamic)? parser,
  }) async {
    final uri = await _buildUrl(api, host: host);
    var response = await _postMultipart(file: file, uri: uri, headers: headers);
    final respStr = await response.stream.bytesToString();
    return _serialiseResponse<T>(
      response: respStr,
      parser: parser,
      print: print,
      showToast: showToast,
    );
  }
}
