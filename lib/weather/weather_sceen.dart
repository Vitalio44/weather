import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/common/widgets/weather_text.dart';
import 'package:weather/weather/cubit/weather_cubit.dart';
import 'package:weather/weather/widgets/weather_day_info_container.dart';
import 'package:weather/weather/widgets/weather_secondary_container.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(7, 0, 255, 0.44),
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherReadyState) {
                return ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/weather/svg/pin.svg'),
                        const SizedBox(width: 8),
                        WeatherText(
                          text: state.weatherModel.location,
                          textType: WeatherTextType.b2m,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 194,
                      height: 190,
                      child: Stack(
                        children: [
                          Align(
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xffBD87FF),
                                    blurRadius: 50.0,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            child: Image.asset(
                              state.weatherModel.weatherImage,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      child: WeatherText(
                        text: '${state.weatherModel.temp.toInt()}º',
                        textType: WeatherTextType.custom,
                        fontSize: 64,
                        color: Colors.white,
                      ),
                    ),
                    Align(
                      child: WeatherText(
                        text: state.weatherModel.weatherDescription
                            .replaceFirst(
                                state.weatherModel.weatherDescription[0],
                                state.weatherModel.weatherDescription[0]
                                    .toUpperCase()),
                        textType: WeatherTextType.b1,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      child: WeatherText(
                        text: 'Макс.: ${state.weatherModel.tempMax.toInt()}º '
                            'Мин: ${state.weatherModel.tempMin.toInt()}º',
                        textType: WeatherTextType.b1,
                        color: Colors.white,
                      ),
                    ),
                    WeatherDayInfoContainer(
                      date: state.weatherModel.formatDatetime(),
                    ),
                    WeatherSecondaryContainer(
                      windSpeed: state.weatherModel.windSpeed,
                      windDescription: state.weatherModel.windDescription,
                      humidity: state.weatherModel.humidity,
                      humidityDescription:
                          state.weatherModel.humidityDescription,
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xff0700FF),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
