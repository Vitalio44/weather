import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather/common/widgets/weather_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _waitResult = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailCotroller = TextEditingController();
  final _pwCotroller = TextEditingController();

  @override
  void dispose() {
    _emailCotroller.dispose();
    _pwCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 51),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const WeatherText(
                  text: 'Вход',
                  textType: WeatherTextType.h1,
                ),
                const WeatherText(
                  text: 'Введите данные для входа',
                  textType: WeatherTextType.b2,
                ),
                const SizedBox(height: 27),
                TextFormField(
                  cursorColor: const Color(0xff0700FF),
                  decoration: InputDecoration(
                    labelText: 'Email',
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0700FF)),
                    ),
                    labelStyle: const WeatherText(
                      text: 'Email',
                      textType: WeatherTextType.b1,
                    ).textStyle,
                  ),
                  controller: _emailCotroller,
                  validator: (String? value) {
                    if (value == null ||
                        value.isEmpty ||
                        !RegExp(r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                            .hasMatch(value)) {
                      return 'Email введен не корректно';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 27),
                TextFormField(
                  cursorColor: const Color(0xff0700FF),
                  validator: (String? value) {
                    if (value == null || value.length < 8) {
                      return 'Не меннее 8 символов';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Пароль',
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff0700FF)),
                    ),
                    labelStyle: const WeatherText(
                      text: 'Пароль',
                      textType: WeatherTextType.b1,
                    ).textStyle,
                    suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                          icon: _obscureText
                              ? SvgPicture.asset('assets/auth/svg/eye.svg')
                              : SvgPicture.asset('assets/auth/svg/eye_off.svg'),
                          // onPressed: _authBloc.switchObscureTextMode,
                        ),
                      ],
                    ),
                  ),
                  controller: _pwCotroller,
                  obscureText: _obscureText,
                ),
                if (_waitResult)
                  const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff0700FF),
                      ),
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          _waitResult = true;
                        });
                        try {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: _emailCotroller.text,
                            password: _pwCotroller.text,
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            log('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            log('The account already exists for that email.');
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                email: _emailCotroller.text,
                                password: _pwCotroller.text,
                              );
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                log('No user found for that email.');
                              } else if (e.code == 'wrong-password') {
                                log('Wrong password provided for that user.');
                              }
                            }
                          }
                        } catch (e) {
                          log(e.toString());
                        }
                      }
                    },
                    child: Container(
                      height: 48,
                      margin: const EdgeInsets.only(top: 48),
                      decoration: BoxDecoration(
                        color: const Color(0xff0700FF),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(255, 88, 93, 0.16),
                            offset: Offset(0, 8),
                            spreadRadius: 3,
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: const Center(
                        child: WeatherText(
                          text: 'Войти',
                          textType: WeatherTextType.b1m,
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
