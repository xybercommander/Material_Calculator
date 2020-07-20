import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  // bool isInteger(num value) =>
  //   value is int || value == value.roundToDouble();

  static String sharedPreferenceResultKey = "RESULT";

  /* SET FUNCTIONS */

  // function for saving the value if int
  static Future<void> saveCalculatedValueInt(num value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setInt(sharedPreferenceResultKey, value);
  }

  // function for saving the value if double
  static Future<void> saveCalculatedValueDouble(num value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setDouble(sharedPreferenceResultKey, value);
  }

  /* GET FUNCTIONS */

  // function for getting the value if int
  static Future<int> getCalculatedValueInt(num value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getInt(sharedPreferenceResultKey);
  }

  // function for getting the value if double
  static Future<double> getCalculatedValueDouble(num value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getDouble(sharedPreferenceResultKey);
  }
}
