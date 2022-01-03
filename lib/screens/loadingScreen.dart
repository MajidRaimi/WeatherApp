import 'dart:io';
import '/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'locationScreen.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Location location = Location();

  void getLocation() async {
    await location.getPermission();
    await location.getLocation();
    NetworkHelper weatherData = NetworkHelper(location);
    await weatherData.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(weatherData),
      ),
    );
  }

  @override
  void initState() {
    getLocation();
    super.initState() ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              SpinKitDoubleBounce(
                color: Colors.teal,
                size: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
