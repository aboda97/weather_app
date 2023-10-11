import 'package:flutter/material.dart';
import 'package:weather/components/not_found_weather_screen.dart';
import 'package:weather/screens/weather_search_screen.dart';

class WeatherHomeScreen extends StatelessWidget {
  const WeatherHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const WeatherSearchScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search_rounded),
            iconSize: 28.0,
          ),
        ],
      ),
      body: const NotFoundWeatherScreen(),
    );
  }
}
