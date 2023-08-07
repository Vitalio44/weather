import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:weather/app.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await initializeDateFormatting('ru_RU', null);
  Intl.defaultLocale = 'ru_RU';
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const WeatherApp());
}
