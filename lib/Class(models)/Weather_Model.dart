import 'package:flutter/foundation.dart';

class WeatherModel {
  final String city;
  final DateTime date;
  final double temp;
  final double mintemp;
  final double maxtemp;
  final String? image;
  final String weathercondtion;

  // constractor

  WeatherModel(
      {required this.city,
      required this.date,
      required this.temp,
      required this.mintemp,
      required this.maxtemp,
      this.image,
      required this.weathercondtion});

  
  // factory constractor get the info from api

  factory WeatherModel.fromjason(jason) {
    return WeatherModel(
        city: jason['location']['name'],
        date: DateTime.parse(jason['current']['last_updated']),
        temp: jason['forecast']['forecastday'][0]['day']['avgtemp_c'],
        mintemp: jason['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxtemp:jason['forecast']['forecastday'][0]['day']['maxtemp_c'],
        weathercondtion: jason['forecast']['forecastday'][0]['day']['condition']['text'],
        image: jason['forecast']['forecastday'][0]['day']['condition']['icon'],
        );
  }
}
