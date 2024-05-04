import 'package:injectable/injectable.dart';
import 'package:sel_org/core/preference/preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String key_customer_id = 'key_customer_id';
const String key_auth_token = 'key_auth_token';
const String key_name = 'key_name';
const String key_email = 'key_email';
const String key_phone_number = 'key_phone_number';

@Injectable(as: Preference)
class AppPreference implements Preference {

  @override
  Future<String> getPrefString(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final authToken = sharedPreferences.getString(key);
    return authToken != null && authToken.isNotEmpty ? authToken: "";
  }

  @override
  Future<void> savePrefString(String key, String valueString) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, valueString);
  }

  @override
  Future<void> clearAll() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

}