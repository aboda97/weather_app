import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherSearchScreen extends StatelessWidget {
  const WeatherSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
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
              getWeatherCubit.getCurrentWeather(cityName: value);
              Navigator.of(context).pop();
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
