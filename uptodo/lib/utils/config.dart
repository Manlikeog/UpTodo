import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uptodo/routes/routes.navigation.dart';
import 'package:uptodo/screens/home/add_task/item_model.dart';
import 'package:uptodo/screens/home/add_task/new_category.dart';
import 'package:uptodo/utils/colours.dart';
import 'package:uptodo/utils/constants.dart';
import 'package:uptodo/utils/dimensions.dart';
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



Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  DateTime? initialDate,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  initialDate ??= DateTime.now();
  firstDate ??= initialDate.subtract(const Duration(days: 365 * 100));
  lastDate ??= firstDate.add(const Duration(days: 365 * 200));

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(selectedDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
}



CategoryModel determineColorType(String categoryType) {
  if (categoryType == 'University') {
    return   CategoryModel(icon: 'univeristy', text:'University', color: 0xFF7F9BFF);
  } else if (categoryType == 'Home') {
    return   CategoryModel(icon: 'house', text: 'Home', color: 0xFFFFCC7F);
  } else if (categoryType == 'Grocery') {
      
    return CategoryModel(icon:'grocery', text:'Grocery', color: 0xFFCCFF7F);
  } else if (categoryType == 'Work') {
    return CategoryModel(icon:'work', text:'Work', color: 0xFFFF967F);
  } else if (categoryType == 'Sport') {
    return CategoryModel(icon:'sport', text:'Sport', color: 0xFF7FFFFF);
  } else if (categoryType == 'Design') {
    return CategoryModel(icon:'design',text: 'Design', color: 0xFF7FFFD8);
  } else if (categoryType == 'Social') {
    return CategoryModel(icon:'social', text:'Social', color: 0xFFFF7FEA);
  } else if (categoryType == 'Music') {
    return   CategoryModel(icon: 'music', text:'Music', color: 0xFFFC7FFF);
  } else if (categoryType == 'Health') {
    return CategoryModel(icon:'health', text: 'Health', color: 0xFF7FFFA3);
  } else if (categoryType == 'Movie') {
    return CategoryModel(icon: 'movie', text: 'Movie', color: 0xFF7FD1FF);
  } else if (categoryType == 'Create New') {
    return CategoryModel(icon: 'add_new', text: 'Create New', color: 0xFF7FFFD1);
  } else {
    return CategoryModel(icon:'sport', text:'Sport', color: 0xFF7FFFFF);
  }
}
