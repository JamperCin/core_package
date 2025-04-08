import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core/utils/file_utils.dart';

class Configuration {
  static Configuration? _config;
  late FileUtils _fileUtils;
  final String _envPath;
  late EnvType? _defaultEnvType;
  late Map<String, dynamic> _envMap;

  ///Configuration private fields to be consumed
  String _userType = "";
  String _defaultEnv = "";
  String _defaultEnvScheme = "";
  String _googleApi = "";
  String _appStoreId = "";
  String _googleEnv = "";
  String _googlePlayLink = "";
  String _appleStoreLink = "";
  String _privacyPolicy = "";
  String _fileUploadApi = "";
  String _termsAndConditions = "";
  int _networkTimeOut = 0;
  int _smsTimer = 0;

  Configuration._(this._envPath, {EnvType? defaultEnv}) {
    _fileUtils = FileUtils();
    _defaultEnvType = defaultEnv;
    _init();
  }

  factory Configuration({required String envPath, EnvType? defaultEnv}) {
    return _config ??= Configuration._(envPath, defaultEnv: defaultEnv);
  }

  Future<void> _init() async {
    await _loadEnvMap();
    _defaultEnv = await _fetchEnvironment(type: _defaultEnvType);
    _googleEnv = await _fetchEnvironment(type: EnvType.google);
    _defaultEnvScheme = await _fetchEnvironmentScheme(type: _defaultEnvType);
    _userType = fetchData(key: 'userType');
    _appStoreId = fetchData(key: 'appStoreId');
    _googleApi = fetchData(key: 'googleApi');
    _networkTimeOut = fetchData(key: 'httpTimeOut');
    _smsTimer = fetchData(key: 'smsTimer');
    _googlePlayLink = fetchData(key: 'googlePlayStoreLink');
    _appleStoreLink = fetchData(key: 'appStoreLink');
    _privacyPolicy = fetchData(key: 'privacyPolicy');
    _termsAndConditions = fetchData(key: 'termsAndConditions');
    _fileUploadApi = fetchData(key: 'fileUploadApi');
  }

  ///--------------------------------------------------------------------------

  Future<dynamic> _loadEnvMap() async {
    _envMap = await _fileUtils.loadResources<Map<String, dynamic>>(
      path: _envPath,
      parser: (json) => json,
    );
  }

  Future<String> _fetchEnvironment({EnvType? type}) async {
    Map<String, dynamic> map = await _fetchEnvMap(type: type);
    return map['host'] as String;
  }

  Future<String> _fetchEnvironmentScheme({EnvType? type}) async {
    Map<String, dynamic> map = await _fetchEnvMap(type: type);
    final isHttpsScheme = map['https'] as bool;
    return isHttpsScheme ? "https" : "http";
  }

  Future<Map<String, dynamic>> _fetchEnvMap({EnvType? type}) async {
    final result = _envMap['env'];
    String envType = (type ?? EnvType.production).name;
    Map<String, dynamic> map = result.where((e) => e['name'] == envType).first;
    return map;
  }

  ///-----------------------------------------------------------------------------

  dynamic fetchData({required String key}) {
    return _envMap.containsKey(key) ? _envMap[key] : null;
  }

  Map<String, dynamic> fetchEnv({String? envKey}) {
    final result = _envMap['env'];
    String envType = envKey ?? EnvType.production.name;
    Map<String, dynamic> map = result.where((e) => e['name'] == envType).first;
    return map;
  }

  String getEnvironment() {
    return _defaultEnv;
  }

  String getEnvironmentScheme() {
    return _defaultEnvScheme;
  }

  String getFileUploadApi(){
    return _fileUploadApi;
  }

  String getGoogleEnvironment() {
    return _googleEnv;
  }

  String getUserType() {
    return _userType;
  }

  String getAppStoreId() {
    return _appStoreId;
  }

  String getGoogleApiKey() {
    return _googleApi;
  }

  String getGooglePlayStoreLink() {
    return _googlePlayLink;
  }

  String getAppleStoreLink() {
    return _appleStoreLink;
  }

  String getPrivacyPolicyLink() {
    return _privacyPolicy;
  }

  String getTermsAndConditionsLink() {
    return _termsAndConditions;
  }

  int getSmsTimer() {
    return _smsTimer;
  }

  int getTimeOut() {
    return _networkTimeOut;
  }
}
