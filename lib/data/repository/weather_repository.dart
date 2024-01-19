import 'dart:convert';

import 'package:weather_app_bloc_patterm/data/data_provider/weather_data_provider.dart';
import 'package:weather_app_bloc_patterm/models/weather_model.dart';

class WeatherRepisitory{
  final WeatherDataProvider weatherDataProvider;

  WeatherRepisitory({required this.weatherDataProvider});
   Future<WeatherModel> getCurrentWeather() async {
    try {
      
      final weatherData = await weatherDataProvider.getCurrentWeather("London");

      final data = jsonDecode(weatherData);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }

}