import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Personal LinkTree'),
          centerTitle: true,
        ),
        body: Center(
          child: LinkTreeWidget(
            assetPath: 'assets/images/1b.png',
            name: 'John Doe',
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
  final String assetPath; // Path to the image asset
  final String name; // Name to display
  final List<LinkButton> links; // List of LinkButton widgets

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
          backgroundImage:
              AssetImage(assetPath), // Using AssetImage for local assets
          radius: 60.0,
        ),
        SizedBox(height: 20),
        Text(name, style: Theme.of(context).textTheme.headline5),
        SizedBox(height: 20),
        for (var linkButton in links) linkButton, // Displaying each link button
      ],
    );
  }
}

class LinkButton extends StatelessWidget {
  final String title; // Button title
  final String url; // URL to launch

  const LinkButton({
    Key? key,
    required this.title,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50)), // Makes buttons wider
        onPressed: () => _launchURL(url),
        child: Text(title),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
