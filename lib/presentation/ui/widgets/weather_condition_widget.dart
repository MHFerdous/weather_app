import 'package:flutter/material.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({
    super.key,
    required this.condition,
  });
  final String condition;

  @override
  Widget build(BuildContext context) {
    return Text(
      condition,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
