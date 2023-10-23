import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/common_function_for_weather.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/models/weather_model.dart';

class InfoWeatherScreen extends StatelessWidget {
  const InfoWeatherScreen({
    Key? key, required this.weathermodeling,
  }) : super(key: key);
  final WeatherModel weathermodeling;
  @override
  Widget build(BuildContext context) {
    var weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
             getThemeForWeatherApp(weathermodeling.cityWeatherCondition),
             getThemeForWeatherApp(weathermodeling.cityWeatherCondition)[300]!,
             getThemeForWeatherApp(weathermodeling.cityWeatherCondition)[400]!,
             getThemeForWeatherApp(weathermodeling.cityWeatherCondition)[700]!,
             getThemeForWeatherApp(weathermodeling.cityWeatherCondition)[800]!,
        ])
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherCubit.weatherModel!.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'updated at ${weatherCubit.weatherModel?.cityDate.hour} : ${weatherCubit.weatherModel?.cityDate.minute}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/cloudy.png',
                ),
                Text(
                  'Average Temp ${weatherCubit.weatherModel!.cityAverageTemp}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Max Temp ${weatherCubit.weatherModel!.cityMaxTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Min Temp ${weatherCubit.weatherModel!.cityMinTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
            Text(
              weatherCubit.weatherModel!.cityWeatherCondition,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
