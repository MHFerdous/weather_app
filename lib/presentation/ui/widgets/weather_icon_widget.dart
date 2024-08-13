import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    super.key,
    required this.value,
  });
  final int value;

  @override
  Widget build(BuildContext context) {
    switch (value) {
      case >= 200 && < 300:
        const Icon(
          WeatherIcons.thunderstorm,
          color: Colors.white,
          size: 260,
        );
      case >= 300 && < 500:
        const Icon(
          WeatherIcons.cloud,
          color: Colors.white,
          size: 260,
        );
      case >= 500 && < 600:
        const Icon(
          WeatherIcons.rain,
          color: Colors.white,
          size: 260,
        );
      case >= 600 && < 700:
        const Icon(
          WeatherIcons.snow,
          color: Colors.white,
          size: 260,
        );
      case >= 700 && < 800:
        const Icon(
          Icons.thunderstorm,
          color: Colors.white,
          size: 260,
        );
      case >= 700 && < 800:
        const Icon(
          WeatherIcons.smoke,
          color: Colors.white,
          size: 260,
        );
      case == 800:
        const Icon(
          WeatherIcons.thunderstorm,
          color: Colors.yellow,
          size: 260,
        );
      case >= 800 && < 804:
        const Icon(
          WeatherIcons.cloud,
          color: Colors.white,
          size: 260,
        );
      default:
        const Icon(
          WeatherIcons.day_sunny,
          color: Colors.yellow,
          size: 260,
        );
    }
    return const Icon(
      WeatherIcons.day_sunny,
      color: Colors.yellow,
      size: 260,
    );
  }
}
