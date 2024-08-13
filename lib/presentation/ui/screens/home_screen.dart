import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/bloc/weather_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/presentation/ui/widgets/date_and_time_widget.dart';
import 'package:weather_app/presentation/ui/widgets/location_widget.dart';
import 'package:weather_app/presentation/ui/widgets/temp_widget.dart';
import 'package:weather_app/presentation/ui/widgets/weather_condition_widget.dart';
import 'package:weather_app/presentation/ui/widgets/weather_details_widget.dart';
import 'package:weather_app/presentation/ui/widgets/weather_icon_widget.dart';

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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
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
                  alignment: const AlignmentDirectional(5, -0.01),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple.shade900),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(-5, -0.01),
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.deepPurple.shade900),
                  ),
                ),
                Align(
                  alignment: const AlignmentDirectional(0, -1.2),
                  child: Container(
                    height: 350,
                    width: 600,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blueAccent.withOpacity(0.8)),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.transparent),
                  ),
                ),
                BlocBuilder<WeatherBlocBloc, WeatherBlocState>(
                  builder: (context, state) {
                    if (state is WeatherBlocSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LocationWidget(
                              location: state.weather.areaName.toString(),
                            ),
                            /*const SizedBox(
                              height: 8,
                            ),
                            const GreetingsWidget(),*/
                            const SizedBox(
                              height: 32,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  WeatherIconWidget(
                                    value: state.weather.weatherConditionCode!,
                                  ),
                                  const SizedBox(
                                    height: 32,
                                  ),
                                  TempWidget(
                                    temperature:
                                        '${state.weather.temperature!.celsius!.round().toString()}°C',
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  WeatherConditionWidget(
                                    condition: state.weather.weatherDescription!
                                        .toUpperCase()
                                        .toString(),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  DateAndTimeWidget(
                                    date: DateFormat('EEEE dd . ')
                                        .add_jm()
                                        .format(state.weather.date!)
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 48,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherDetailsWidget(
                                  icon: const Icon(
                                    Icons.sunny,
                                    color: Colors.yellow,
                                    size: 38,
                                  ),
                                  title: 'Sunrise',
                                  value: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunrise!)
                                      .toString(),
                                ),
                                WeatherDetailsWidget(
                                  icon: const Icon(
                                    Icons.nights_stay,
                                    color: Colors.blue,
                                    size: 38,
                                  ),
                                  title: 'Sunset',
                                  value: DateFormat()
                                      .add_jm()
                                      .format(state.weather.sunset!)
                                      .toString(),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Divider(
                                thickness: 0.2,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                WeatherDetailsWidget(
                                  icon: const Icon(
                                    Icons.device_thermostat,
                                    color: Colors.red,
                                    size: 38,
                                  ),
                                  title: 'Max Temp',
                                  value:
                                      '${state.weather.tempMax!.celsius!.round().toString()}°C',
                                ),
                                WeatherDetailsWidget(
                                  icon: const Icon(
                                    Icons.device_thermostat,
                                    color: Colors.blue,
                                    size: 38,
                                  ),
                                  title: 'Min Temp',
                                  value:
                                      '${state.weather.tempMin!.celsius!.round().toString()}°C',
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
