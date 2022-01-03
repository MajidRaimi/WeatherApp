import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    String myMargin = "15";
    double? myMarginAsADouble ;
    try{
      myMarginAsADouble = double.parse(myMargin) ;
    } catch(e){
      print("Wrong Margin Input !") ;
    }

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.red,
          margin: EdgeInsets.all(
            myMarginAsADouble ?? 30
          ),
        ),
      ),
    );
  }
}
