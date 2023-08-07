import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/services/weather_preferences.dart';

part 'base_state.dart';

class BaseCubit extends Cubit<BaseState> {
  BaseCubit() : super(BaseInitial());

  Future<void> init() async {
    final weatherData = await WeatherPreferencesService.readWeather();
    final position = await _determinePosition();
    FirebaseAuth.instance.authStateChanges().listen((event) {
      if (event != null) {
        emit(BaseWeather(localWeatherData: weatherData, position: position));
      } else {
        emit(BaseAuth());
      }
    });
  }

  Future<Position?> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return null;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return null;
    }
    if (permission == LocationPermission.deniedForever) return null;
    return await Geolocator.getCurrentPosition();
  }
}
