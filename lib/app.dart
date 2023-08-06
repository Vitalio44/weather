import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:weather/auth/auth_screen.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 28, color: Color(0xff2B2D33)),
          headlineMedium: TextStyle(fontSize: 20, color: Color(0xff2B2D33)),
          bodyMedium: TextStyle(fontSize: 15, fontFamily: 'Roboto Regular'),
          bodyLarge: TextStyle(
            fontSize: 17,
            fontFamily: 'Roboto Regular',
            color: Color(0xff8799A5),
          ),
          bodySmall: TextStyle(fontSize: 13, fontFamily: 'Roboto Regular'),
        ),
      ),
      home: Scaffold(
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Center(
                child: TextButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                  },
                  child: Text(
                    'Выход',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ),
              );
            }
            return const AuthScreen();
          },
        ),
      ),
    );
  }
}
