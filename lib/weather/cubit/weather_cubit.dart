import 'package:bloc/bloc.dart';
import 'package:weather/confige.dart';
import 'package:weather/services/weather_preferences.dart';
import 'package:weather/weather/data/models/weather_model.dart';
import 'package:weather/weather/data/provider/weather_api.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    this.localWeatherData,
    this.latitude,
    this.longitude,
  }) : super(WeatherInitState());

  final String? localWeatherData;
  final double? latitude;
  final double? longitude;

  final _weatherApi = WeatherApi();

  Future<void> init() async {
    if (localWeatherData != null) {
      emit(WeatherReadyState(WeatherModel.fromJson(localWeatherData!)));
    }
    final weatherData = await _weatherApi.getWeatherInfo(
      latitude: latitude ?? (TEST_DATA['coord'] as Map)['lat'] as double,
      longitude: longitude ?? (TEST_DATA['coord'] as Map)['lon'] as double,
    );
    if (weatherData != null) {
      emit(WeatherReadyState(weatherData));
      WeatherPreferencesService.saveWeather(weatherData.toString());
    } else {
      if (localWeatherData == null) {
        emit(WeatherReadyState(WeatherModel.fromMap(TEST_DATA)));
      }
    }
  }
}
