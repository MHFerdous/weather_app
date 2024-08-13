part of 'weather_bloc_bloc.dart';

@immutable
sealed class WeatherBlocEvent {
  const WeatherBlocEvent();

  List<Object> get props => [];
}

class FetchWeather extends WeatherBlocEvent {
  final Position position;

  const FetchWeather(this.position);
  @override
  List<Object> get props => [position];
}
