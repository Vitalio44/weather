import 'package:http/http.dart' as http;
import 'package:weather/confige.dart';
import 'package:weather/weather/data/models/weather_model.dart';

class WeatherApi {
  Future<WeatherModel?> getWeatherInfo({
    required double latitude,
    required double longitude,
  }) async {
    final response = await http.get(
      Uri.parse('https://api.openweathermap.org/data/2.5/weather?'
          'lat=$latitude&lon=$longitude&exclude=daily&'
          'appid=$OPEN_WEATHER_APP_ID&units=metric&lang=ru'),
    );
    return response.statusCode == 200
        ? WeatherModel.fromJson(response.body)
        : null;
  }
}
