import 'dart:ui';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.fromLTRB(
          40,
          1.2 * kToolbarHeight,
          40,
          20,
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Align(
                alignment: AlignmentDirectional(5, -0.1),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.shade900),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-5, -0.1),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.deepPurple.shade900),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0, -1.1),
                child: Container(
                  height: 300,
                  width: 600,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle, color: Colors.blueAccent),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: BoxDecoration(color: Colors.transparent),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LocationWidget(),
                    SizedBox(
                      height: 8,
                    ),
                    GreetingsWidget(),
                    SizedBox(
                      height: 32,
                    ),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          WeatherIconWidget(),
                          SizedBox(
                            height: 32,
                          ),
                          TempWidget(),
                          SizedBox(
                            height: 8,
                          ),
                          WeatherSituationWidget(),
                          SizedBox(
                            height: 8,
                          ),
                          DateAndTimeWidget(),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherDetailsWidget(
                          icon: Icon(
                            Icons.sunny,
                            color: Colors.yellow,
                            size: 38,
                          ),
                          title: 'Sunrise',
                          value: '5:55am',
                        ),
                        WeatherDetailsWidget(
                          icon: Icon(
                            Icons.nights_stay,
                            color: Colors.blue,
                            size: 38,
                          ),
                          title: 'Sunset',
                          value: '5:55pm',
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: Divider(
                        thickness: 0.2,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        WeatherDetailsWidget(
                          icon: Icon(
                            Icons.device_thermostat,
                            color: Colors.red,
                            size: 38,
                          ),
                          title: 'Max Temp',
                          value: '32C',
                        ),
                        WeatherDetailsWidget(
                          icon: Icon(
                            Icons.device_thermostat,
                            color: Colors.blue,
                            size: 38,
                          ),
                          title: 'Min Temp',
                          value: '26C',
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDetailsWidget extends StatelessWidget {
  const WeatherDetailsWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });
  final Icon icon;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            ),
            Text(
              value,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
            )
          ],
        )
      ],
    );
  }
}

class DateAndTimeWidget extends StatelessWidget {
  const DateAndTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Monday 12 . 09:07pm',
      style: TextStyle(
          color: Colors.white.withOpacity(0.5),
          fontSize: 16,
          fontWeight: FontWeight.normal),
    );
  }
}

class WeatherSituationWidget extends StatelessWidget {
  const WeatherSituationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'THUNDERSTROM',
      style: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.w400),
    );
  }
}

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.thunderstorm,
      color: Colors.white,
      size: 260,
    );
  }
}

class TempWidget extends StatelessWidget {
  const TempWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '30^C',
      style: TextStyle(
          color: Colors.white, fontSize: 48, fontWeight: FontWeight.w500),
    );
  }
}

class GreetingsWidget extends StatelessWidget {
  const GreetingsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Night',
      style: TextStyle(
          color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          Icons.location_on,
          color: Colors.red,
        ),
        Text(
          'Sylhet, Bangladesh',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
