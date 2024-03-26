import 'package:flutter/material.dart';
import '../widgets/contact_form.dart';
import '../widgets/appbar.dart'; 
import '../widgets/footer.dart'; 

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    void _navigateHome() {
      Navigator.of(context).pushNamed('/');
    }

    void _navigateToAboutUs() {
      Navigator.of(context).pushNamed('/aboutUs');
    }

    void _navigateToServices() {
      Navigator.of(context).pushNamed('/services');
    }

    void _navigateToContactUs() {
    }

    void _toggleDarkMode() {
    }

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          isDarkMode: isDarkMode,
          toggleDarkMode: _toggleDarkMode,
          scaffoldKey: _scaffoldKey,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContactForm(),
              Footer(isDarkMode: isDarkMode)
            ],
          ),
        ),
      ),
    );
  }
}
