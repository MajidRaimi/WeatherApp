import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';

class LocationScreen extends StatefulWidget {
  final NetworkHelper weatherData;
  LocationScreen(this.weatherData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage("images/weatherImage.svg"),
        ) ,
      ),
    );
  }
}
