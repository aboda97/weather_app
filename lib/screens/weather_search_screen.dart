import 'package:flutter/material.dart';
import 'package:weather/main.dart';
import 'package:weather/services/weather_services.dart';




class WeatherSearchScreen extends StatelessWidget {
  
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search a City',
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            onSubmitted: (value) async {
              print(value);
              weatherModel =
                  await WeatherServices().getCurrentWeather(cityName: value);
              Navigator.of(context).pop();
              //log(weatherModel.cityName);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 32.0,
              ),
              suffixIcon: const Icon(Icons.search_rounded),
              label: const Text('City Name'),
              hintText: 'City Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: const BorderSide(color: Colors.lightBlue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
