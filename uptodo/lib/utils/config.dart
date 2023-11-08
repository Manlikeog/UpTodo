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

determineColorType(String categoryType) {
  if (categoryType == 'University') {
    return 0xFF7F9BFF;
  } else if (categoryType == 'Home') {
    return 0xFFFFCC7F;
  } else if (categoryType == 'Grocery') {
    return 0xFFCCFF7F;
  } else if (categoryType == 'Work') {
    return 0xFFFF967F;
  } else if (categoryType == 'Sport') {
    return 0xFF7FFFFF;
  } else if (categoryType == 'Design') {
    return 0xFF7FFFD8;
  } else if (categoryType == 'Social') {
    return 0xFFFF7FEA;
  } else if (categoryType == 'Music') {
    return 0xFFFC7FFF;
  } else if (categoryType == 'Health') {
    return 0xFF7FFFA3;
  } else if (categoryType == 'Movie') {
    return 0xFF7FD1FF;
  } else if (categoryType == 'Create New') {
    return 0xFF7FFFD1;
  } else {
    return 0xFFFFCC7F;
  }
}
