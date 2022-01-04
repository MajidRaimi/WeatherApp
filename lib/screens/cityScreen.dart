import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final _value = TextEditingController();

  String cityName = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0x000ff731),
        leading: GestureDetector(
          child: const Icon(
            Icons.arrow_back,
            color: Colors.teal,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: 50,
                  child: TextField(
                    onChanged: (text) {
                      cityName = text;
                    },
                    decoration: kBorderTheme,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context , cityName) ;
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30) ,
                  ),
                  child: const Center(
                    child: Text(
                      "Get Weather",
                      style: TextStyle(color: Colors.white, fontSize: 26 , fontFamily: "Pacifico" ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
