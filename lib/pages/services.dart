import 'package:flutter/material.dart';
import '../widgets/appbar.dart'; 
import '../widgets/footer.dart'; 

class ServicesPage extends StatefulWidget {
  @override
  _ServicesPageState createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  bool isDarkMode = false; 

  @override
  Widget build(BuildContext context) {
    isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          isDarkMode: isDarkMode,
          toggleDarkMode: () {},
          navigateHome: () => Navigator.of(context).pushNamed('/'),
          navigateToAboutUs: () => Navigator.pushNamed(context, '/aboutUs'),
          navigateToServices: () {}, 
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
                    'Our Services',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'We offer a wide range of services to help you achieve your goals:',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(height: 10),
                  _buildServiceItem(
                    context,
                    'Branding',
                    'Building your brand identity and strategy.',
                    Icons.brush,
                  ),
                  _buildServiceItem(
                    context,
                    'Web Development',
                    'Custom websites and web applications tailored to your needs.',
                    Icons.web,
                  ),
                  _buildServiceItem(
                    context,
                    'Social Media',
                    'Engaging your audience through powerful social media strategies.',
                    Icons.share,
                  ),
                  _buildServiceItem(
                    context,
                    'Experiences',
                    'Creating unforgettable experiences and events.',
                    Icons.event_available,
                  ),
                  _buildServiceItem(
                    context,
                    'Marketing',
                    'Comprehensive marketing services to grow your visibility.',
                    Icons.trending_up,
                  ),
                  _buildServiceItem(
                    context,
                    'Press',
                    'Managing press relations and communications.',
                    Icons.record_voice_over,
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

  Widget _buildServiceItem(BuildContext context, String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: isDarkMode ? Colors.white : Colors.black),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      subtitle: Text(subtitle),
    );
  }
}
