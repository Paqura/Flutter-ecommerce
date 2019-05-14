import 'package:flutter/material.dart';
import 'package:flutter_test_eco/pages/register_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter E-commerce',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.cyan[100],
        accentColor: Colors.deepOrange[200],
        textTheme: TextTheme(
          headline: TextStyle(fontSize: 36.0),
          body1: TextStyle(fontSize: 24.0),
        ),
      ),
      home: RegisterPage(),
    );
  }
}