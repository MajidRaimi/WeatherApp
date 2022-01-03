import 'package:clima/utilities/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  final _value = TextEditingController() ;

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Container(
                height: 50,
                child: const TextField(
                  decoration: kBorderTheme,

                  controller: _value,

                ),
              ),
            ),
            const Text(
              "Get Weather",
              style: TextStyle(color: Colors.teal, fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
