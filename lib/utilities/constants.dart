import 'package:flutter/material.dart';

class WeatherCondition {
  String weatherCondition(int id) {
    if (200 <= id && id <= 232) {
      return "Thunderstorms";
    } else if (300 <= id && id <= 321) {
      return "Drizzles";
    } else if (500 <= id && id <= 531) {
      return "Rains";
    } else if (600 <= id && id <= 621) {
      return "Snows";
    } else if (id == 701) {
      return "Mists";
    } else if (id == 711) {
      return "Smokes";
    } else if (id == 721) {
      return "Hazes";
    } else if (id == 731 && id == 761) {
      return "Dusts";
    } else if (id == 741) {
      return "Fogs";
    } else if (id == 751) {
      return "Sands";
    } else if (id == 762) {
      return "Ashes";
    } else if (id == 771) {
      return "Squalls";
    } else if (id == 781) {
      return "Tornadoes";
    } else if (id == 800) {
      return "Clear";
    } else if (801 <= id && id <= 804) {
      return "Clouds";
    } else {
      return " ";
    }
  }
}


const kBorderTheme = InputDecoration(
  hintText: "Enter City Name",
  border: OutlineInputBorder(),
) ;
