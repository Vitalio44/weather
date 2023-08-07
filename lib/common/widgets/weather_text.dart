import 'package:flutter/material.dart';

enum WeatherTextType { custom, h1, h1m, h2, h2m, b1, b1m, b2, b2m, b3, b3m }

class WeatherText extends StatelessWidget {
  const WeatherText({
    super.key,
    required this.text,
    this.fontSize = 17,
    this.fontFamily = 'Ubuntu',
    this.textType = WeatherTextType.custom,
    this.color,
  });

  final String fontFamily;
  final String text;
  final double fontSize;
  final Color? color;
  final WeatherTextType textType;

  TextStyle get textStyle => _styleByType();

  @override
  Widget build(BuildContext context) {
    return Text(text, style: _styleByType());
  }

  TextStyle _styleByType() {
    switch (textType) {
      case WeatherTextType.h1:
        return const TextStyle(
          fontSize: 28,
          color: Color(0xff2B2D33),
          fontFamily: 'Ubuntu',
        );
      case WeatherTextType.b1:
        return TextStyle(
          fontSize: 17,
          color: color ?? const Color(0xff8799A5),
          fontFamily: 'Roboto Regular',
        );
      case WeatherTextType.b1m:
        return const TextStyle(
          fontSize: 17,
          color: Colors.white,
          fontFamily: 'Roboto Medium',
        );
      case WeatherTextType.b2:
        return TextStyle(
          fontSize: 15,
          color: color ?? const Color(0xff8799A5),
          fontFamily: 'Roboto Regular',
          height: 2,
        );
      case WeatherTextType.b2m:
        return TextStyle(
          fontSize: 15,
          color: color ?? Colors.white,
          fontFamily: 'Roboto Medium',
        );
      // WeatherTextType.b2m
      default:
        return TextStyle(
          fontFamily: fontFamily,
          fontSize: fontSize,
          color: color ?? const Color(0xff2B2D33),
        );
    }
  }
}
