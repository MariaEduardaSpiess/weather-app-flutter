import 'package:flutter/material.dart';
import 'package:weather_app/models/viacep_response_model.dart';
import 'package:weather_app/services/cep_service.dart';

import 'weather_info_page.dart';

class FormWeather extends StatefulWidget {
  @override
  _FormWeatherState createState() => _FormWeatherState();
}

class _FormWeatherState extends State<FormWeather> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlCEP = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(128, 155, 206, 1),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(50),
            child: _formUI(),
          ),
        ),
      ),
    );
  }

  Widget _formUI() {
    const TextStyle _textWhiteStyle = TextStyle(color: Colors.white);
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.disabled,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Image.asset('logo.png'),
          ),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'CEP',
              labelStyle: _textWhiteStyle,
              counterStyle: _textWhiteStyle,
              border: OutlineInputBorder(),
            ),
            maxLength: 8,
            style: _textWhiteStyle,
            controller: _ctrlCEP,
            validator: _validarCEP,
            keyboardType: TextInputType.number,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(184, 224, 210, 1)),
              ),
              onPressed: () {
                _sendForm();
              },
              child: const Text('Buscar', style: TextStyle(color: Color.fromRGBO(51, 80, 132, 1))),
            ),
          ),
        ],
      ),
    );
  }

  String _validarCEP(String value) {
    const String patttern = r'(^\d{8}$)';
    final RegExp regExp = RegExp(patttern);
    if (value.isEmpty) {
      return 'Informe o CEP';
    } else if (!regExp.hasMatch(value)) {
      return 'O CEP informado não é válido.';
    }
    return null;
  }

  void _sendForm() {
    if (_formKey.currentState.validate()) {
      final String cep = _ctrlCEP.text;
      if (cep.isNotEmpty) {
        getWeatherFromCEP(cep).then((value) => openWeatherInfo(value));
      }
    }
  }

  void openWeatherInfo(ViaCEPResponse cepInfo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => new WeatherInfoPage(cepInfo: cepInfo),
      ),
    );
  }
}
