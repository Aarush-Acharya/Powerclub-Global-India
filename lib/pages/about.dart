import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
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
          navigateToAboutUs: () {},
          navigateToServices: () => Navigator.pushNamed(context, '/services'),
          navigateToContactUs: () => Navigator.pushNamed(context, '/contactUs'),
          scaffoldKey: GlobalKey<ScaffoldState>(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'About Us',
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'At the heart of our mission lies a singular commitment: to build a brighter tomorrow, today. '
                'As a forward-thinking global consultancy, we unite with the worlds pioneering changemakers to craft the future. '
                'Spanning across the globe, our team operates as a unified force, dedicated to propelling our clients towards remarkable achievements. '
                'Our ethos is defined by the pursuit of excellence, the drive to surpass competition, and the vision to transform industries.\n\n'

                'Our approach is characterized by a bespoke, integrated expertise, augmented by a dynamic ecosystem of digital pioneers. '
                'This combination ensures not only superior outcomes but does so with unmatched speed and sustainability. '
                'Reflecting our commitment to societal progress, we have pledged a portion of our profits and human capital to the Emergence NGO. '
                'This initiative aims to harness our collective skills and insights to address pressing issues in education, racial equity, social justice, economic development, and environmental conservation.\n\n'

                'Pride in our work is matched by our recognition as an industry leader in ethical, social, and environmental practices. '
                'This accolade places us in the elite top 1% of businesses worldwide, a testament to our commitment to making a positive impact on the world. '
                'Since our inception in 2019, our measure of success has always been the success of our clients. '
                'It is this unwavering dedication that has earned us the highest client advocacy in the industry. '
                'Together, we champion the bold and innovate with integrity to achieve the extraordinary, today.',
                style: Theme.of(context).textTheme.bodyText1?.copyWith(color: isDarkMode ? Colors.white : Colors.black),
                textAlign: TextAlign.justify, // For better readability
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(isDarkMode: isDarkMode),
    );
  }
}
