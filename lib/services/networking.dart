import '/services/location.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.location);
  final Location location;
  late String temp;
  late String cond;
  late String city;

  http.Response? response;
  Future getData() async {
    try {
      Uri url = Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=bc12083e70d2d22298c2df1cec7101d9&unit=metric');

      response = await http.get(url);
      if (response?.statusCode == 200) {
        print(response?.statusCode);
        String? data = response?.body;

        temp = jsonDecode(data!)["main"]['temp'].toString();
        cond = jsonDecode(data)["weather"][0]["id"].toString();
        city = jsonDecode(data)["name"].toString();

      } else {
        print(response?.statusCode);
      }
    } catch (e) {
      print("Could Not Access The API");
    }
  }
}
