import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/appbar.dart'; 
import '../widgets/footer.dart'; 
import '../widgets/home_results.dart';
import '../widgets/home_video.dart';
import '../widgets/home_insights.dart';
import '../widgets/home_connect.dart';
import '../widgets/home_newsletter.dart';
import 'about.dart'; 
import 'services.dart'; 
import 'contact.dart'; 



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final PageController _pageController = PageController(initialPage: 500, viewportFraction: .33);
  double currentPageValue = 500.0;
  bool isDarkMode = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _openWebsiteInWebView(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true, enableJavaScript: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  void _navigateHome() {
    Navigator.of(context).pushNamed('/'); 
  }

  @override
  Widget build(BuildContext context) {
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
        child: Column(
          children: [
            Container(
              height: 500,
              child: Image.asset('assets/hero_image${isDarkMode ? "_b" : ""}.png', fit: BoxFit.fitHeight),
            ),
            Container(
              height: 200.0,
              color: isDarkMode ? Colors.black : Colors.white,
              child: PageView.builder(
                controller: _pageController,
                itemCount: 10000,
                itemBuilder: (context, index) {
                  final logoIndex = index % 5;
                  final logoImagePath = 'assets/${(logoIndex + 1)}${isDarkMode ? "b" : ""}.png';
                  final urls = [
                    'https://ethdenver2023-kingbodhi.vercel.app/',
                    'https://fineartsociety.xyz',
                    'https://crypto-hash-nine.vercel.app/',
                    'https://emergenceiii.vercel.app',
                    'https://yachtmasterapp.com',
                  ];

                  return InkWell(
                    onTap: () async {
                      if (urls.length > logoIndex) {
                        await _openWebsiteInWebView(urls[logoIndex]);
                      }
                    },
                    child: Image.asset(logoImagePath, width: 100.0),
                  );
                },
              ),
            ),
            const ResultsSection(),
            HomeVideo(videoUrl: 'https://www.youtube.com/watch?v=lE23UzCPsVg'),
            InsightsSection(),
            HomeConnect(),
            HomeNewsletter(),
            Footer(isDarkMode: isDarkMode), 
          ],
        ),
      ),
    );
  }
}




