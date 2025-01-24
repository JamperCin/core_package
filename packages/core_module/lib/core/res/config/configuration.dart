import 'package:core_module/core/enum/env_type.dart';
import 'package:core_module/core/utils/file_utils.dart';

class Configuration {
  static Configuration? _config;
  late FileUtils _fileUtils;
  final String _envPath;
  late EnvType? _defaultEnvType;

  ///Configuration fields
  String _userType = "";
  String _defaultEnv = "";
  String _googleApi = "";
  String _appStoreId = "";
  String _googleEnv = "";
  int _networkTimeOut = 0;
  int _smsTimer = 0;

  Configuration._(this._envPath,{EnvType? defaultEnv}) {
    _fileUtils = FileUtils();
    _defaultEnvType = defaultEnv;
    _init();
  }

  factory Configuration({required String envPath,EnvType? defaultEnv}) {
    return _config ??= Configuration._(envPath, defaultEnv: defaultEnv);
  }

  Future<void> _init() async {
    _defaultEnv =  await _fetchEnvironment(type: _defaultEnvType);
    _googleEnv =  await _fetchEnvironment(type: EnvType.google);
    _userType = await _fileUtils.fetchObject(_envPath, 'userType');
    _appStoreId = await _fileUtils.fetchObject(_envPath, 'appStoreId');
    _googleApi = await _fileUtils.fetchObject(_envPath, 'googleApi');
    _networkTimeOut = await _fileUtils.fetchObject(_envPath, 'timeOut');
    _smsTimer = await _fileUtils.fetchObject(_envPath, 'smsTimer');
  }

  Future<String> _fetchEnvironment({EnvType? type}) async {
    final results =
        await _fileUtils.fetchListOfMap(path: _envPath, key: 'env');
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

  int getSmsTimer(){
    return _smsTimer;
  }

  int getTimeOut(){
    return _networkTimeOut;
  }
}
