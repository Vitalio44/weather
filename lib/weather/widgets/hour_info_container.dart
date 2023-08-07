import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/common/widgets/weather_text.dart';

class HourInfoContainer extends StatelessWidget {
  const HourInfoContainer({
    super.key,
    this.isActive = false,
    required this.time,
    required this.temp,
  });

  final bool isActive;
  final String time;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142,
      width: 74,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white.withOpacity(isActive ? 1 : 0)),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          WeatherText(
            text: time,
            textType: WeatherTextType.b2,
            color: Colors.white,
          ),
          SvgPicture.asset('assets/weather/svg/cloud_sun.svg'),
          WeatherText(
            text: temp,
            textType: WeatherTextType.b1m,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
