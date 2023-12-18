import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../response/login/register_customer_response.dart';
import '../../response/login/validate_otp_response.dart';

class CacheHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<void> ensureInitialized() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  static dynamic getData({required String key}) {
    return _sharedPreferences?.get(key);
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    await ensureInitialized();
    if (value is String) return await _sharedPreferences!.setString(key, value);
    if (value is double) return await _sharedPreferences!.setDouble(key, value);
    if (value is bool) return await _sharedPreferences!.setBool(key, value);
    if (value is List<String>) return await _sharedPreferences!.setStringList(key, value);
    return await _sharedPreferences!.setInt(key, value);
  }

  static Future<void> saveRegistrationResponse(RegisterCustomerResponse registerCustomerResponse) async {
    await saveData(key: 'register_response', value: json.encode(registerCustomerResponse.toJson()));
    await saveData(key: "token", value: "Bearer ${registerCustomerResponse.data?.accessToken}");
  }

  static Future<void> saveOtpResponse(ValidateOtpResponse otpResponse) async{
    await saveData(key: 'otp_response',value: json.encode(otpResponse.toJson()));
    await saveData(key: 'token', value: "Bearer ${otpResponse.data?.accessToken}");
  }

  static String getToken() {
    return getData(key: "token").toString();
  }
}
