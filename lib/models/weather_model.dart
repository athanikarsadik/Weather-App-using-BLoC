// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  final double currentTemp;
  final double currentPressure;
  final double currentHumidity;
  final double currentWindSpeed;
  final String currentSky;
  WeatherModel({
    required this.currentTemp,
    required this.currentPressure,
    required this.currentHumidity,
    required this.currentWindSpeed,
    required this.currentSky,
  });

  WeatherModel copyWith({
    double? currentTemp,
    double? currentPressure,
    double? currentHumidity,
    double? currentWindSpeed,
    String? currentSky,
  }) {
    return WeatherModel(
      currentTemp: currentTemp ?? this.currentTemp,
      currentPressure: currentPressure ?? this.currentPressure,
      currentHumidity: currentHumidity ?? this.currentHumidity,
      currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
      currentSky: currentSky ?? this.currentSky,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'currentTemp': currentTemp,
      'currentPressure': currentPressure,
      'currentHumidity': currentHumidity,
      'currentWindSpeed': currentWindSpeed,
      'currentSky': currentSky,
    };
  }

  factory WeatherModel.fromMap(Map<String, dynamic> map) {

    final currentWeatherData = map['list'][0];

    return WeatherModel(
      currentTemp: currentWeatherData['main']['temp'],
      currentPressure: currentWeatherData['main']['pressure'],
      currentHumidity: currentWeatherData['main']['humidity'],
      currentWindSpeed: currentWeatherData['wind']['speed'],
      currentSky: currentWeatherData['weather'][0]['main'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WeatherModel(currentTemp: $currentTemp, currentPressure: $currentPressure, currentHumidity: $currentHumidity, currentWindSpeed: $currentWindSpeed, currentSky: $currentSky)';
  }

  @override
  bool operator ==(covariant WeatherModel other) {
    if (identical(this, other)) return true;

    return other.currentTemp == currentTemp &&
        other.currentPressure == currentPressure &&
        other.currentHumidity == currentHumidity &&
        other.currentWindSpeed == currentWindSpeed &&
        other.currentSky == currentSky;
  }

  @override
  int get hashCode {
    return currentTemp.hashCode ^
        currentPressure.hashCode ^
        currentHumidity.hashCode ^
        currentWindSpeed.hashCode ^
        currentSky.hashCode;
  }
}
