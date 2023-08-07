import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/common/widgets/weather_text.dart';
import 'package:weather/weather/widgets/hour_info_container.dart';

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
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/weather/svg/pin.svg'),
                  const SizedBox(width: 8),
                  const WeatherText(
                    text: 'Архангельск, Россия',
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
                        'assets/weather/images/Variant1.webp',
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                child: WeatherText(
                  text: '28º',
                  textType: WeatherTextType.custom,
                  fontSize: 64,
                  color: Colors.white,
                ),
              ),
              const Align(
                child: WeatherText(
                  text: 'Гроза',
                  textType: WeatherTextType.b1,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Align(
                child: WeatherText(
                  text: 'Макс.: 31º Мин: 25º',
                  textType: WeatherTextType.b1,
                  color: Colors.white,
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 24),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WeatherText(
                            text: 'Сегодня',
                            textType: WeatherTextType.b1m,
                          ),
                          WeatherText(
                            text: '20 марта',
                            textType: WeatherTextType.b2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Colors.white),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HourInfoContainer(
                            time: '14:00',
                            temp: '23º',
                          ),
                          HourInfoContainer(
                            isActive: true,
                            time: '15:00',
                            temp: '23º',
                          ),
                          HourInfoContainer(
                            time: '16:00',
                            temp: '23º',
                          ),
                          HourInfoContainer(
                            time: '17:00',
                            temp: '23º',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 96,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SecondaryWeatherInfoItem(
                      data: '2 м/с',
                      info: 'Ветер северо-восточный',
                    ),
                    SecondaryWeatherInfoItem(
                      isWind: false,
                      data: '100%',
                      info: 'Высокая влажность',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondaryWeatherInfoItem extends StatelessWidget {
  const SecondaryWeatherInfoItem({
    super.key,
    required this.data,
    required this.info,
    this.isWind = true,
  });

  final bool isWind;
  final String data;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              SvgPicture.asset(
                isWind
                    ? 'assets/weather/svg/wind.svg'
                    : 'assets/weather/svg/drop.svg',
              ),
              const SizedBox(width: 8),
              WeatherText(
                text: data,
                textType: WeatherTextType.b2m,
                color: Colors.white.withOpacity(0.2),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 3,
          child: WeatherText(
            text: info,
            textType: WeatherTextType.b2,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
