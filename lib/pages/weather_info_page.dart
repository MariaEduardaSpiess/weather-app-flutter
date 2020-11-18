import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/viacep_response_model.dart';
import 'package:weather_app/models/weather_response.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherInfoPage extends StatefulWidget {
  final ViaCEPResponse cepInfo;
  WeatherInfoPage({Key key, @required this.cepInfo}) : super(key: key);

  @override
  _WeatherInfoPageState createState() => _WeatherInfoPageState(cepInfo);
}

class _WeatherInfoPageState extends State<WeatherInfoPage> {
  final ViaCEPResponse cepInfo;
  WeatherResponse weatherInfo = new WeatherResponse();

  _WeatherInfoPageState(this.cepInfo);

  @override
  void initState() {
    getWeather(cepInfo.localidade, cepInfo.uf, 'Brazil')
        .then((value) => setState(() {
              weatherInfo = value;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(128, 155, 206, 1),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(50.0),
          height: 500,
          child: Column(
            children: [
              Text(cepInfo.localidade,
                  style: const TextStyle(fontSize: 35, color: Colors.white)),
              Text(cepInfo.logradouro + ', ' + cepInfo.bairro,
                  style: const TextStyle(fontSize: 18, color: Colors.white)),
              Spacer(flex: 2),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Image.network('http://openweathermap.org/img/wn/' +
                      weatherInfo.weather[0]?.icon +
                      '@2x.png'),
                  Text(weatherInfo.main.temp.toStringAsFixed(0) + '°',
                      style:
                          const TextStyle(fontSize: 100, color: Colors.white)),
                ],
              ),
              Text(
                  'Sensação de ' +
                      weatherInfo.main.feelsLike.toStringAsFixed(0) +
                      '°',
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              Text(weatherInfo.weather[0]?.description,
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              Spacer(flex: 2),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Icon(
                    Icons.opacity,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text(
                      'Umidade do ar: ' +
                          weatherInfo.main.humidity.toString() +
                          'g/Kg',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0, // gap between adjacent chips
                runSpacing: 4.0, // gap between lines
                children: <Widget>[
                  Icon(
                    Icons.waves,
                    color: Colors.white,
                    size: 24.0,
                  ),
                  Text('Vento: ' + weatherInfo.wind.speed.toString() + 'km/h',
                      style:
                          const TextStyle(fontSize: 20, color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
