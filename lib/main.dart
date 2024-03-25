import 'package:flutter/material.dart';
import 'pages/home.dart'; 
import 'pages/about.dart'; 
import 'pages/services.dart'; 
import 'pages/contact.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Powerclub Global',
      theme: ThemeData(
      ),
      home: Home(),
      routes: {
        '/aboutUsPage': (context) => AboutUsPage(),
        '/servicesPage': (context) => ServicesPage(),
        '/contactUsPage': (context) => ContactUsPage(),
      },
    );
  }
}
