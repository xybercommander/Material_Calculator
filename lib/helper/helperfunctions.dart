import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  // bool isInteger(num value) =>
  //value is int || value == value.roundToDouble();

  static String sharedPreferenceResultKey = "RESULT";

  /* SET FUNCTIONS */

  // function for saving the value if double
  static Future<void> saveCalculatedValueDouble(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceResultKey, value);
  }

  /* GET FUNCTIONS */

  // function for getting the value if double
  static Future<String> getCalculatedValueString(num value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceResultKey);
  }
}
