import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/data/my_data.dart';

part 'weather_bloc_event.dart';
part 'weather_bloc_state.dart';

class WeatherBlocBloc extends Bloc<WeatherBlocEvent, WeatherBlocState> {
  WeatherBlocBloc() : super(WeatherBlocInitial()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherBlocLoading());
      try {
        WeatherFactory weatherFactory =
            WeatherFactory(apiKey, language: Language.ENGLISH);

        Weather weather = await weatherFactory.currentWeatherByLocation(
            event.position.latitude, event.position.longitude);
        emit(WeatherBlocSuccess(weather));
        print(weather);
      } catch (e) {
        emit(WeatherBlocFailure());
      }
    });
  }
}
