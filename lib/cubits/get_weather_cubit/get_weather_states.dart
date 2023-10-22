import 'package:weather/models/weather_model.dart';

abstract class GetWeatherStates {}

class WeatherInitState extends GetWeatherStates {}

class WeatherSuccessState extends GetWeatherStates {
  final WeatherModel weatherModel;

  WeatherSuccessState(this.weatherModel);
}

class WeatherFailureState extends GetWeatherStates {
  final String msgErr;

  WeatherFailureState(this.msgErr);
}
