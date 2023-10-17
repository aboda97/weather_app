import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final String apiKey = 'e92c06fcf8324c5db7672708231210';
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String url = '/forecast.json';
  final Dio dio = Dio();

  Future<WeatherModel> getCurrentWeather(
      {required String cityName, int? excpectDays}) async {
    try {
      Response response = await dio
          .get('$baseUrl$url?key=$apiKey&q=$cityName&days=$excpectDays');
      //to represent data into model
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final errMsg = e.response?.data['error']['message'] ??
          'Ops, You have a problem.. Please try Again';
      throw Expando(errMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('Ops, You have a problem.. Please try Again');
    }
  }
}
