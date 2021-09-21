import 'package:app_weather/screens/homeScreen.dart';
import 'package:app_weather/screens/settingScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => HomeScreen(),
          '/setting': (_) => SettingScreen(),
        });
  }
}
