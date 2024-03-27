import 'package:flutter/material.dart';
import 'package:pcg/theme/theme.dart';
import 'package:pcg/theme/theme_manager.dart';
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
            '/aboutUsPage': (context) => AboutUsPage(),
            '/servicesPage': (context) => ServicesPage(),
            '/contactUsPage': (context) => ContactUsPage(),
          },
        );
      },
    );
  }
}
