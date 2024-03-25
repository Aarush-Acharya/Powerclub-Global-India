import 'package:flutter/material.dart';
import '../widgets/appbar.dart'; 
import '../widgets/footer.dart'; 

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool isDarkMode = false; 

  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          isDarkMode: isDarkMode,
          toggleDarkMode: _toggleDarkMode,
          navigateHome: () => Navigator.of(context).pushNamed('/'), 
          navigateToAboutUs: () {}, 
          navigateToServices: () => Navigator.pushNamed(context, '/services'),
          navigateToContactUs: () => Navigator.pushNamed(context, '/contactUs'),
          scaffoldKey: GlobalKey<ScaffoldState>(), 
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About Us',
                    style: Theme.of(context).textTheme.headline4, 
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Here at Powerclub Global, we believe in...',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Footer(isDarkMode: isDarkMode),
          ),
        ],
      ),
    );
  }
}
