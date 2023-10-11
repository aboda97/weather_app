import 'package:flutter/material.dart';
import 'package:weather/screens/not_found_weather_screen.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: const NotFoundWeatherScreen(),
    );
  }
}