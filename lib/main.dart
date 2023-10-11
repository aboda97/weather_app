import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/screens/weather_home_screen.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherHomeScreen(),
    );
  }
}
