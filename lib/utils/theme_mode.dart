import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier with ChangeNotifier {
  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;
  ThemeNotifier() {
    loadTheme();
  }
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    saveTheme();
    notifyListeners();
  }
  void saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
  void loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    notifyListeners();
  }
}


ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 18),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.amber,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.amber,
    titleTextStyle: TextStyle(color: Colors.black, fontSize: 18),
  ),
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
  ),
);