import 'package:flutter/material.dart';
import 'package:qrapp/pages/home_page.dart';
import 'package:qrapp/pages/map_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Reader',
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'map': (_) => MapPage(),
      },
    );
  }
}
