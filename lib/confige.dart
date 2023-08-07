const OPEN_WEATHER_APP_ID = '61ce4b00d42d710ee0b5286c1e7f522d';

const TEST_DATA = {
  "coord": {"lon": 30.1705, "lat": 59.8509},
  "weather": [
    {"id": 800, "main": "Clear", "description": "ясно", "icon": "01d"}
  ],
  "base": "stations",
  "main": {
    "temp": 32,
    "feels_like": 32.84,
    "temp_min": 31.73,
    "temp_max": 32.11,
    "pressure": 1008,
    "humidity": 43
  },
  "visibility": 10000,
  "wind": {"speed": 8.94, "deg": 120, "gust": 0},
  "clouds": {"all": 0},
  "dt": 1691406727,
  "sys": {
    "type": 1,
    "id": 8926,
    "country": "RU",
    "sunrise": 1691373248,
    "sunset": 1691432172
  },
  "timezone": 10800,
  "id": 478724,
  "name": "Урицк",
  "cod": 200
};
