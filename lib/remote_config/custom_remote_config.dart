import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';

class CustomRemoteConfig {
  late FirebaseRemoteConfig _firebaseRemoteConfig;

  CustomRemoteConfig._internal();
  static final CustomRemoteConfig _singleton = CustomRemoteConfig._internal();
  factory CustomRemoteConfig() => _singleton;

  Future<void> initialize() async {
    _firebaseRemoteConfig = FirebaseRemoteConfig.instance;
    await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1)));
    await _firebaseRemoteConfig.fetchAndActivate();
  }

  Future<void> forceFetch() async {
    try {
      await _firebaseRemoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero));
      await _firebaseRemoteConfig.fetchAndActivate();
    } on PlatformException catch (exception) {
      throw (exception.toString());
    } catch (exception) {
      throw ("Erro ao buscar dados remotamente");
    }
  }

  getValueOrDefault({required String key, required dynamic defaultValue}) {
    switch (defaultValue.runtimeType) {
      case String:
        var value = _firebaseRemoteConfig.getString(key);
        return value != '' ? value : defaultValue;
      case int:
        var value = _firebaseRemoteConfig.getInt(key);
        return value != 0 ? value : defaultValue;
      case bool:
        var value = _firebaseRemoteConfig.getBool(key);
        return value != false ? value : defaultValue;
      case double:
        var value = _firebaseRemoteConfig.getDouble(key);
        return value != 0.0 ? value : defaultValue;
      default:
        return Exception("Not Found");
    }
  }
}
