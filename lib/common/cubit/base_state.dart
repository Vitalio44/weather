part of 'base_cubit.dart';

abstract class BaseState {}

class BaseInitial extends BaseState {}

class BaseAuth extends BaseState {}

class BaseWeather extends BaseState {
  final String? localWeatherData;
  final Position? position;

  BaseWeather({this.localWeatherData, this.position});
}
