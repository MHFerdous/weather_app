import 'package:flutter/material.dart';

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({
    super.key,
    required this.date,
  });
  final String date;

  @override
  Widget build(BuildContext context) {
    return Text(
      date,
      style: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
