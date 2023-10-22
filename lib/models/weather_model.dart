class WeatherModel {
  final String cityName;
  final DateTime cityDate;
  final double cityMinTemp;
  final double cityMaxTemp;
  final double cityAverageTemp;
  final String cityWeatherCondition;
  final String? cityIcon;

  WeatherModel({
    this.cityIcon, 
    required this.cityWeatherCondition,
    required this.cityName,
    required this.cityDate,
    required this.cityMinTemp,
    required this.cityMaxTemp,
    required this.cityAverageTemp,
  });

  factory WeatherModel.fromJson(jsonData) {
    return
     WeatherModel(
      cityName: jsonData['location']['name'] ?? '',
      cityDate: DateTime.parse(jsonData['current']['last_updated'] ?? '') ,
      cityMinTemp: jsonData['forecast']['forecastday'][0]['day']['mintemp_c'] ?? 0.0,
      cityMaxTemp: jsonData['forecast']['forecastday'][0]['day']['maxtemp_c'] ?? 0.0,
      cityAverageTemp: jsonData['forecast']['forecastday'][0]['day']['avgtemp_c'] ?? 0.0,
      cityWeatherCondition: jsonData['forecast']['forecastday'][0]['day']['condition']['text'] ?? '',
       cityIcon: jsonData['forecast']['forecastday'][0]['day']['condition']['icon'] ?? '',
    );
  }
}
