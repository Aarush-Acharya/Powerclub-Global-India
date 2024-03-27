import 'package:flutter/material.dart';
import 'package:pcg/theme/theme_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themeManager.isDarkMode ? Colors.black : Colors.white,
      child: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          Ink(
              height: 150,
              width: 150,
              child: Image.asset(
                  'assets/pcg${themeManager.isDarkMode ? "_b" : ""}.png',
                  height: 60.0)),
          SizedBox(
            height: 20,
          ),
          ListTile(
            title: Text('About Us'),
            onTap: () => Navigator.pushNamed(context, '/aboutUsPage'),
          ),
          ListTile(
            title: Text('Services'),
            onTap: () => Navigator.pushNamed(context, '/servicesPage'),
          ),
          ListTile(
            title: Text('Contact Us'),
            onTap: () => Navigator.pushNamed(context, '/contactUsPage'),
          ),
        ],
      ),
    );
  }
}
