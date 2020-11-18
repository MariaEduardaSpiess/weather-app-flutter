import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/weather_response.dart';

Future<WeatherResponse> getWeather(
    String cidade, String estado, String pais) async {
  final http.Response response = await http.get(
      'http://api.openweathermap.org/data/2.5/weather?q=$cidade,$estado,$pais&lang=pt_br&units=metric&appid=e8962427977895dc7b82576019a60ef1');
  if (response.statusCode == 200) {
    return WeatherResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao buscar dados metereológicos');
  }
}
