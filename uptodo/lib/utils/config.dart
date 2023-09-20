import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo/utils/helper.dart';

Future<bool> checkIfIsFirstLaunch() async {
  String? user = await Helper.userStored;
 
  if (user == null) {
    return true;
  } else {
    return false;
  }
}

Future<String?> readPrefData(String key) async {
  final prefs = await SharedPreferences.getInstance();

  String? data = prefs.getString(key);

  return data;
}

Future<void> writePrefData(String key, String data) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(key, data);
}