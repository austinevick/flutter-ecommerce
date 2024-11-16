import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

final userEmailProvider = Provider((ref) => PreferenceManager.getUserEmail());

AndroidOptions _getAndroidOptions() =>
    const AndroidOptions(encryptedSharedPreferences: true);

class PreferenceManager {
  static const String TOKEN = 'token';
  static const String EMAIL = 'email';
  static const String NAME = 'name';
  static const String PASSCODE = 'passcode';
  static const String TRUSTTOKEN = 'trust_token';

  static final secureStorage =
      FlutterSecureStorage(aOptions: _getAndroidOptions());

/////////////---------User Token------------/////////////
  static Future<void> saveUserToken(String value) async {
    await secureStorage.write(key: TOKEN, value: value);
  }

  static Future<String> getUserToken() async {
    return await secureStorage.read(key: TOKEN) ?? '';
  }

/////////////---------User Passcode------------/////////////
  static Future<void> saveUserPasscode(String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(PASSCODE, value);
  }

  static Future<String> getUserPasscode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(PASSCODE) ?? '';
  }

/////////////---------Username------------/////////////
  static Future<void> saveUserName(String value) async {
    await secureStorage.write(key: NAME, value: value);
  }

  static Future<String> getUserName() async =>
      await secureStorage.read(key: NAME) ?? '';

/////////////---------Email------------/////////////
  static Future<void> saveUserEmail(String value) async {
    await secureStorage.write(key: EMAIL, value: value);
  }

  static Future<String> getUserEmail() async =>
      await secureStorage.read(key: EMAIL) ?? '';

/////////////---------Trust Token------------/////////////
  static Future<void> saveTrustToken(String value) async {
    await secureStorage.write(key: TRUSTTOKEN, value: value);
  }

  static Future<String> getTrustToken() async =>
      await secureStorage.read(key: TRUSTTOKEN) ?? '';

  static Future<void> delete() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await secureStorage.deleteAll();
  }
}
