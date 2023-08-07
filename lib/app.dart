import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/auth/auth_screen.dart';
import 'package:weather/common/cubit/base_cubit.dart';
import 'package:weather/common/widgets/splash_screen.dart';
import 'package:weather/weather/cubit/weather_cubit.dart';
import 'package:weather/weather/weather_sceen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => BaseCubit()..init(),
        child: const WeatherAppContent(),
      ),
    );
  }
}

class WeatherAppContent extends StatelessWidget {
  const WeatherAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BaseCubit, BaseState>(
      builder: (context, state) {
        if (state is BaseAuth) {
          return const AuthScreen();
        } else if (state is BaseWeather) {
          return BlocProvider(
            create: (context) => WeatherCubit(
              localWeatherData: state.localWeatherData,
              latitude: state.position?.latitude,
              longitude: state.position?.longitude,
            )..init(),
            child: const WeatherScreen(),
          );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}
