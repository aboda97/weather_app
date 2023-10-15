import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final Dio dio = Dio();
  Future<WeatherModel> getWeather(
      {required String cityName, int? excpectDays}) async {
    String apiKey = 'e379586390334e68a58121414230103';
    String baseUrl = 'https://api.weatherapi.com/v1';
    String url = '/forecast.json';
    Response response = await dio
        .get('$baseUrl/$url?key=$apiKey&q=$cityName&days=$excpectDays');

    //to represent data into model
    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }
}
