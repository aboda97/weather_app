import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/services/weather_services.dart';

class GetWeatherCubit extends Cubit<GetWeatherStates> {
  GetWeatherCubit() : super(WeatherInitState());
WeatherModel? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices().getCurrentWeather(cityName: cityName);
      emit(
        WeatherSuccessState(weatherModel!),
      );
    } catch (e) {
      emit(
        WeatherFailureState(e.toString()),
      );
    }
  }
}
