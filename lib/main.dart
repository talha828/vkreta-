// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vkreta/login.dart';
void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Vkreta',
    home: AnimatedSplashScreen(
      backgroundColor: Colors.blue.shade900,
      nextScreen: LoginScreen(),
      splash: Image.asset('assets/logo.png'),
      duration: 2000,
      splashIconSize: 130,
      splashTransition: SplashTransition.fadeTransition,
    ),
  ));
}


