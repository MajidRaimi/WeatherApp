import 'dart:convert';
import 'package:clima/screens/cityScreen.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/networking.dart';
import 'package:http/http.dart' as http;

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

  void updateUIByCity(String typedCity) async {
    try {
      Uri url = Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$typedCity&appid=bc12083e70d2d22298c2df1cec7101d9");
      http.Response response = await http.get(url);
      String data = response.body;

      String temp = jsonDecode(data)["main"]['temp'].toString();
      String cond = jsonDecode(data)["weather"][0]["id"].toString();
      String city = jsonDecode(data)["name"].toString();

      setState(
        () {
          cityTemp = (double.parse(temp) - 273).toInt();
          cityName = city;
          cityCondition = double.parse(cond).toInt();
        },
      );
    } catch (e) {
      print("PEPE");
    }
  }

  void updateUI() {
    setState(() {
      cityTemp = (double.parse(widget.weatherData.temp) - 273).toInt();
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
            onTap: () async {
              String typedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CityScreen(),
                ),
              );
              if (typedCity != "" || typedCity != null) {
                updateUIByCity(typedCity);
              }
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Image(
                image: AssetImage("images/One-removebg-preview.png"),
              ),
              Spacer(),
              Text(
                "${WeatherCondition().weatherCondition(cityCondition)} At $cityName City.",
                style: TextStyle(color: Colors.teal, fontSize: 22 , fontFamily: "Pacifico"),
              ),
              Spacer(),
              Text(
                "$cityTemp° C",
                style: TextStyle(color: Colors.teal, fontSize: 36 , fontFamily: "Pacifico"),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
