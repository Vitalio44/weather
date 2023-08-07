import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/common/widgets/weather_text.dart';

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
            height: 1,
          ),
        ),
      ],
    );
  }
}
