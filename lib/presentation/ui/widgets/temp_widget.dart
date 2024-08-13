import 'package:flutter/material.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({
    super.key,
    required this.temperature,
  });
  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      temperature,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 48,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
