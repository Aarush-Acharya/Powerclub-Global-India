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
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: CustomAppBar(
        isDarkMode: isDarkMode,
        toggleDarkMode: _toggleDarkMode,
        navigateHome: _navigateHome,
        navigateToAboutUs: _navigateToAboutUs,
        navigateToServices: _navigateToServices,
        navigateToContactUs: _navigateToContactUs,
        scaffoldKey: _scaffoldKey,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ContactForm(),
            Footer(isDarkMode: isDarkMode),
          ],
        ),
      ),
    );
  }
}
