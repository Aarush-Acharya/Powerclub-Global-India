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
            assetPath: 'assets/images/bodhi.png',
            name: 'Jessy Bodhi Artman',
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
  final List<LinkButton> links;

  const LinkTreeWidget({
    Key? key,
    required this.assetPath,
    required this.name,
    required this.links,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(assetPath),
          radius: 60.0,
        ),
        const SizedBox(height: 20),
        Text(name, style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 20),
        for (var linkButton in links) linkButton,
      ],
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
    // Check if the current theme is dark
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDarkMode
              ? Colors.white
              : Color(0xFFDCB62A), // Background color based on theme
          foregroundColor: isDarkMode
              ? Colors.black
              : Colors.white, // Text color based on theme
          minimumSize: const Size(double.infinity, 50),
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
