import 'dart:js';

import 'package:clima/screens/cityScreen.dart';
import 'package:clima/screens/loadingScreen.dart';
import 'package:clima/screens/locationScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Named Routes Demo',

      initialRoute: '/',
      routes: {
        '/CityScreen': (context) => const CityScreen(),
        '/LoadingScreen': (context) => const LoadingScreen(),
        '/LocationScreen' : (context) => const LocationScreen() ,
      },
    ),
  );
}



