import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core/utils/file_utils.dart';

class Configuration {
  static Configuration? _config;
  late FileUtils _fileUtils;
  final String _envPath;
  late EnvType? _defaultEnvType;

  ///Configuration private fields to be consumed
  String _userType = "";
  String _defaultEnv = "";
  String _googleApi = "";
  String _appStoreId = "";
  String _googleEnv = "";
  String _googlePlayLink = "";
  String _appleStoreLink = "";
  String _privacyPolicy = "";
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
    _defaultEnv = await _fetchEnvironment(type: _defaultEnvType);
    _googleEnv = await _fetchEnvironment(type: EnvType.google);
    _userType = await fetchData(key: 'userType');
    _appStoreId = await fetchData(key: 'appStoreId');
    _googleApi = await fetchData(key: 'googleApi');
    _networkTimeOut = await fetchData(key: 'timeOut');
    _smsTimer = await fetchData(key: 'smsTimer');
    _googlePlayLink = await fetchData(key: 'googlePlayLink');
    _appleStoreLink = await fetchData(key: 'appleStoreLink');
    _privacyPolicy = await fetchData(key: 'privacyPolicy');
    _termsAndConditions = await fetchData(key: 'termsAndConditions');
  }

  Future<dynamic> fetchData({required String key}) async {
    return await _fileUtils.fetchObject(_envPath, key);
  }

  Future<String> _fetchEnvironment({EnvType? type}) async {
    final results = await _fileUtils.fetchListOfMap(path: _envPath, key: 'env');
    String envType = (type ?? EnvType.production).name;
    Map<String, dynamic> map = results.where((e) => e['name'] == envType).first;
    return map['host'] as String;
  }

  String getEnvironment() {
    return _defaultEnv;
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

  int getSmsTimer() {
    return _smsTimer;
  }

  int getTimeOut() {
    return _networkTimeOut;
  }
}
