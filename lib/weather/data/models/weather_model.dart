import 'dart:convert';

import 'package:intl/intl.dart';

class WeatherModel {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double humidity;
  final String weatherDescription;
  final double windSpeed;
  final int windDeg;
  final String weatherIcon;
  final int datetime;

  WeatherModel({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
    required this.weatherDescription,
    required this.windSpeed,
    required this.windDeg,
    required this.weatherIcon,
    required this.datetime,
  });

  Map toMap() {
    return {
      'name': location,
      'main': {
        'temp': temp,
        'temp_min': tempMin,
        'temp_max': tempMax,
        'humidity': humidity
      },
      'weather': [
        {'description': weatherDescription, 'icon': weatherIcon}
      ],
      'wind': {
        'speed': windSpeed,
        'deg': windDeg,
      },
      'dt': datetime,
    };
  }

  @override
  String toString() => json.encode(toMap());

  factory WeatherModel.fromMap(Map map) {
    return WeatherModel(
      location: map['name'] ?? '',
      temp: map['main']['temp']?.toDouble() ?? 0.0,
      tempMin: map['main']['temp_min']?.toDouble() ?? 0.0,
      tempMax: map['main']['temp_max']?.toDouble() ?? 0.0,
      humidity: map['main']['humidity']?.toDouble() ?? 0.0,
      weatherDescription: map['weather'][0]['description'] ?? '',
      windSpeed: map['wind']['speed']?.toDouble() ?? 0.0,
      windDeg: map['wind']['deg']?.toInt() ?? 0.0,
      weatherIcon: map['weather'][0]['icon'] ?? '',
      datetime: map['dt'] ?? 0,
    );
  }

  factory WeatherModel.fromJson(String source) =>
      WeatherModel.fromMap(json.decode(source));

  String get windDescription => _windDescriptionByDeg();

  String get humidityDescription => _humidityDescriptionInfo();

  String get weatherImage => _imagePathByIcon();

  String _windDescriptionByDeg() {
    if (windDeg < 67) {
      return 'северо-восточный';
    } else if (windDeg < 112) {
      return 'восточный';
    } else if (windDeg < 175) {
      return 'юго-восточный';
    } else if (windDeg < 202) {
      return 'южный';
    } else if (windDeg < 247) {
      return 'юго-западный';
    } else if (windDeg < 292) {
      return 'западный';
    } else if (windDeg < 337) {
      return 'северо-западный';
    } else {
      return 'северный';
    }
  }

  // Взято с https://weather.fandom.com/ru/wiki/%D0%92%D0%BB%D0%B0%D0%B6%D0%BD%D0%BE%D1%81%D1%82%D1%8C
  String _humidityDescriptionInfo() {
    if (humidity < 4) {
      return 'Безводная влажность';
    } else if (humidity < 10) {
      return 'Песчаная влажность';
    } else if (humidity < 23) {
      return 'Сухая влажность';
    } else if (humidity < 41) {
      return 'Низкая влажность';
    } else if (humidity < 53) {
      return 'Средняя влажность';
    } else if (humidity < 65) {
      return 'Привычная влажность';
    } else if (humidity < 74) {
      return 'Умеренная влажность';
    } else if (humidity < 82) {
      return 'Высокая влажность';
    } else if (humidity < 99) {
      return 'Туманная влажность';
    } else {
      return 'Мокрая влажность';
    }
  }

  String _imagePathByIcon() {
    if (weatherIcon.startsWith('01')) {
      return 'assets/weather/images/Variant2.webp';
    } else if (weatherIcon.startsWith('02')) {
      return 'assets/weather/images/Variant2.webp';
    } else if (weatherIcon.startsWith('11')) {
      return 'assets/weather/images/Variant1.webp';
    } else if (weatherIcon.startsWith('09')) {
      return 'assets/weather/images/Variant5.webp';
    } else if (weatherIcon.startsWith('10')) {
      return 'assets/weather/images/Variant4.webp';
    } else if (weatherIcon.startsWith('13')) {
      return 'assets/weather/images/Variant4.webp';
    } else {
      return 'assets/weather/images/Variant2.webp';
    }
  }

  String formatDatetime() {
    final date = DateTime.fromMillisecondsSinceEpoch(datetime * 1000);
    final dateString = DateFormat('d MMMM').format(date);
    return dateString;
  }
}
