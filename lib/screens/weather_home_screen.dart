import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/info_weather_screen.dart';
import 'package:weather/components/not_found_weather_screen.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
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
      body: BlocBuilder<GetWeatherCubit, GetWeatherStates>(
        builder: (context, state) {
          if (state is WeatherInitState) {
            return const NotFoundWeatherScreen();
          } else if (state is WeatherSuccessState) {
            return  InfoWeatherScreen(weathermodeling: state.weatherModel, );
          } else {
            return const Text('You have an Error');
          }
        },
      ),
    );
  }
}
