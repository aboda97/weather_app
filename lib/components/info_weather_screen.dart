import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class InfoWeatherScreen extends StatelessWidget {
  const InfoWeatherScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var weatherCubit = BlocProvider.of<GetWeatherCubit>(context);
    return Padding(
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
            '${weatherCubit.weatherModel!.cityWeatherCondition}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
        ],
      ),
    );
  }
}
