import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather/auth/auth_screen.dart';
import 'package:weather/weather/weather_sceen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const WeatherScreen();
            // return Center(
            //   child: TextButton(
            //     onPressed: () {
            //       FirebaseAuth.instance.signOut();
            //     },
            //     child: Text(
            //       'Выход',
            //       style: Theme.of(context).textTheme.headlineLarge,
            //     ),
            //   ),
            // );
          }
          return const AuthScreen();
        },
      ),
    );
  }
}
