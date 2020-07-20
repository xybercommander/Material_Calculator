import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceResultKey = "RESULT";

  /* SET FUNCTIONS */

  // function for saving the value if double
  Future<void> saveCalculatedValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(sharedPreferenceResultKey, value);
  }

  /* GET FUNCTIONS */

  // function for getting the value if double
  Future<String> getCalculatedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(sharedPreferenceResultKey);
  }
}
