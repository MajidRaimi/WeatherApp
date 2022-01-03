import 'package:clima/screens/loadingScreen.dart';
import 'package:clima/screens/cityScreen.dart';
import 'package:clima/screens/locationScreen.dart';
import 'package:flutter/material.dart';

import 'services/location.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/LoadingScreen',
      title: 'Named Routes Demo',
      routes: {
        '/CityScreen': (context) => const CityScreen(),
        '/LoadingScreen': (context) => const LoadingScreen(),

      },
    ),
  );
}
