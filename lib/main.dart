import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/components/common_function_for_weather.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
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
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherStates>(
          builder: (BuildContext context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeForWeatherApp(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.cityWeatherCondition),
              ),
              debugShowCheckedModeBanner: false,
              home: const WeatherHomeScreen(),
            );
          },
        ),
      ),
    );
  }

  }
