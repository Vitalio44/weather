part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitState extends WeatherState {}

class WeatherReadyState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherReadyState(this.weatherModel);
}
