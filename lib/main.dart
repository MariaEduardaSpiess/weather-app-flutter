import 'package:flutter/material.dart';

import 'pages/form_weather_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormWeather(),
    );
  }
}
