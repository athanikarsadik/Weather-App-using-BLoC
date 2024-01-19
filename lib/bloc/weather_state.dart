part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccess extends WeatherState {
  final WeatherModel weather;

  WeatherSuccess(this.weather);
}

final class WeatherFailure extends WeatherState {
  final String error;

  WeatherFailure({required this.error});
}

final class WeatherLoading extends WeatherState {}