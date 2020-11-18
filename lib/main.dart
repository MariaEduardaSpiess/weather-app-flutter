import 'package:flutter/material.dart';

import 'pages/form_weather_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(128, 155, 206, 1),
        body: FormWeather(),
      ),
    );
  }
}
