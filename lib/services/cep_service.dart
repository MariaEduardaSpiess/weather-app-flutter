import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/viacep_response_model.dart';

Future getWeatherFromCEP(String cep) async {
  final http.Response response =
      await http.get('https://viacep.com.br/ws/$cep/json/');
  if (response.statusCode == 200) {
    return ViaCEPResponse.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Falha ao buscar CEP');
  }
}
