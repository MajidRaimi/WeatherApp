import 'package:clima/screens/cityScreen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';

class LocationScreen extends StatefulWidget {
  final NetworkHelper weatherData;
  LocationScreen(this.weatherData);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int cityTemp = 0;
  String cityName = "";
  int cityCondition = 0;

  void updateUI() {
    setState(() {
      cityTemp = (double.parse(widget.weatherData.temp)).toInt();
      cityName = widget.weatherData.city;
      cityCondition = double.parse(widget.weatherData.cond).toInt();
    });
  }

  @override
  void initState() {
    updateUI();
    print(cityName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x000ff731),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CityScreen(),
                ),
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0, top: 8),
              child: Icon(
                Icons.location_city,
                color: Colors.teal,
              ),
            ),
          )
        ],
        leading: GestureDetector(
          onTap: () {
            updateUI();
          },
          child: const Icon(
            Icons.repeat,
            color: Colors.teal,
          ),
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(WeatherCondition().weatherCondition(cityCondition)),
              const Image(
                image: AssetImage("images/One-removebg-preview.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
