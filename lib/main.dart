import 'package:flutter/material.dart';
import 'package:pcg/theme/theme.dart';
import 'package:pcg/theme/theme_manager.dart';
import 'pages/home.dart';
import 'pages/industries.dart';
import 'pages/services.dart';
import 'pages/insights.dart';
import 'pages/about.dart';
import 'pages/contact.dart';
import 'pages/careers.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: themeManager,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: 'Powerclub Global',
          theme: MyAppThemes.lightTheme,
          darkTheme: MyAppThemes.darkTheme,
          themeMode: themeManager.themeMode,
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => Home(),
            '/industriesPage': (context) => IndustriesPage(),
            '/servicesPage': (context) => ServicesPage(),
            '/insightsPage': (context) => InsightsPage(),
            '/aboutUsPage': (context) => AboutUsPage(),
            '/contactUsPage': (context) => ContactUsPage(),
            '/careersPage': (context) => CareersPage(),
          },
        );
      },
    );
  }
}
