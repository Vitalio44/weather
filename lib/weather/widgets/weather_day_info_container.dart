import 'package:flutter/material.dart';
import 'package:weather/common/widgets/weather_text.dart';
import 'package:weather/weather/widgets/hour_info_container.dart';

class WeatherDayInfoContainer extends StatelessWidget {
  const WeatherDayInfoContainer({super.key, required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const WeatherText(
                  text: 'Сегодня',
                  textType: WeatherTextType.b1m,
                ),
                WeatherText(
                  text: date,
                  textType: WeatherTextType.b2,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white),
          // Нет данных в API
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
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
    );
  }
}
