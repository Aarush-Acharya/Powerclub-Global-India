import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(), // Define light theme
      darkTheme: ThemeData.dark(), // Define dark theme
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Chief Visionary Officer'),
          centerTitle: true,
        ),
        body: const Center(
          child: LinkTreeWidget(
            assetPath: 'bodhi.png',
            name: 'Jessy Bodhi Artman',
            contact: 'bodhi@powerclubglobal.com',
            links: [
              LinkButton(title: 'Website', url: 'https://www.example.com'),
              LinkButton(title: 'GitHub', url: 'https://github.com'),
              LinkButton(title: 'LinkedIn', url: 'https://linkedin.com'),
              // Add more links as needed
            ],
          ),
        ),
      ),
    );
  }
}

class LinkTreeWidget extends StatelessWidget {
  final String assetPath;
  final String name;
  final String contact;
  final List<LinkButton> links;

  const LinkTreeWidget({
    Key? key,
    required this.assetPath,
    required this.name,
    required this.contact,
    required this.links,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 20), // Added padding above the image
            CircleAvatar(
              backgroundImage: AssetImage(assetPath),
              radius: 60.0,
            ),
            const SizedBox(height: 20),
            Text(name, style: Theme.of(context).textTheme.headline5),
            SizedBox(height: 8), // Padding above the contact field
            Text(contact, style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(height: 20),
            ...links.map((link) => Container(
                  width: isDesktop
                      ? constraints.maxWidth * 0.5
                      : double.infinity, // Adjust for desktop view
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: link,
                )),
          ],
        );
      },
    );
  }
}

class LinkButton extends StatelessWidget {
  final String title;
  final String url;

  const LinkButton({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0), // Space between buttons
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color:
                isDarkMode ? Colors.white : Color(0xFFDCB62A), // Border color
            width: 2.0, // Border width
          ),
          foregroundColor: isDarkMode
              ? Colors.white
              : Colors.black, // Adjusted text color for light mode
          minimumSize: const Size(double.infinity, 50),
          padding: const EdgeInsets.symmetric(vertical: 16.0), // Adjust padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                30.0), // Increased border radius for rounded corners
          ),
        ),
        onPressed: () => _launchURL(url),
        child: Text(title),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
