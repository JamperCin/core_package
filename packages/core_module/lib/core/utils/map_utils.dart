import 'dart:convert';

class MapUtils {
  static MapUtils? _mapUtils;

  MapUtils._();

  factory MapUtils() {
    return _mapUtils ??= MapUtils._();
  }

  /// Converts [value] to a JSON string.
  ///
  /// If value contains objects that are not directly encodable to a JSON
  /// string (a value that is not a number, boolean, string, null, list or a map
  /// with string keys), the [toEncodable] function is used to convert it to an
  /// object that must be directly encodable.
  ///
  /// If [toEncodable] is omitted, it defaults to a function that returns the
  /// result of calling `.toJson()` on the unencodable object.
  ///
  /// Throws a JsonEncodingError if [value] results impossible to encode.
  String convertEncode(Object value) {
    try {
      return json.encode(value);
    } catch (e) {
      print(e);
      return "";
    }
  }

  dynamic convertDecode(dynamic object) {
    if (object is Map) {
      return object;
    }
    String body = (object is String) ? object : convertEncode(object);
    try {
      return jsonDecode(_utf8convert(body));
    } catch (e) {
      return jsonDecode(body);
    }
  }

   String _utf8convert(String text) {
    List<int> bytes = text.toString().codeUnits;
    return utf8.decode(bytes);
  }

  T? stringToObject<T>(String jsonString,T Function(dynamic) parser) {
    if (jsonString.isNotEmpty) {
      final json = convertDecode(jsonString);
      return parser(json);
    } else {
      return null;
    }
  }

}
