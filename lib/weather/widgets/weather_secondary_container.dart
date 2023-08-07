import 'package:flutter/material.dart';
import 'package:weather/weather/widgets/secondary_weather_info_item.dart';

class WeatherSecondaryContainer extends StatelessWidget {
  const WeatherSecondaryContainer({
    super.key,
    required this.windSpeed,
    required this.windDescription,
    required this.humidity,
    required this.humidityDescription,
  });

  final double windSpeed;
  final String windDescription;
  final double humidity;
  final String humidityDescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.25),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SecondaryWeatherInfoItem(
            data: '${windSpeed.toInt()} м/с',
            info: 'Ветер $windDescription',
          ),
          SecondaryWeatherInfoItem(
            isWind: false,
            data: '${humidity.toInt()}%',
            info: humidityDescription,
          ),
        ],
      ),
    );
  }
}
