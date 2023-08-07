import 'package:shared_preferences/shared_preferences.dart';

class WeatherPreferencesService {
  static Future<void> saveWeather(String data) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('weather', data);
  }

  static Future<String?> readWeather() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('weather');
  }
}
