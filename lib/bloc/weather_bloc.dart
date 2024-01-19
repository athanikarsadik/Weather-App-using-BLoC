import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc_patterm/data/repository/weather_repository.dart';
import 'package:weather_app_bloc_patterm/models/weather_model.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final WeatherRepisitory weatherRepisitory;

  WeatherBloc(this.weatherRepisitory) : super(WeatherInitial()) {
    on<WeatherFetched>(_getCurrentWeather);
  }

  void _getCurrentWeather(WeatherFetched event, Emitter<WeatherState> emit)async {
    emit(WeatherLoading());
    await Future.delayed(Duration(seconds: 2));
    try {
       final weather = await weatherRepisitory.getCurrentWeather();
       emit(WeatherSuccess(weather));
    } catch (e) {
        emit(WeatherFailure(error: e.toString()));    
    }
  }
}
