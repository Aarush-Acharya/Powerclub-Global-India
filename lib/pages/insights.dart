import 'package:flutter/material.dart';
import 'package:pcg/widgets/home_insights.dart';
import '../widgets/appbar.dart'; // Make sure the path is correct
import '../widgets/footer.dart';
import '../widgets/drawer.dart';

class InsightsPage extends StatelessWidget {
  const InsightsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey =
        GlobalKey<ScaffoldState>(); // For drawer

    return Scaffold(
      key: scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: scaffoldKey,
          // Add other required arguments for CustomAppBar here
        ),
      ),
      drawer: const CustomDrawer(), // Assuming you have a CustomDrawer widget
      body: const Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 60),
                    Text(
                      'Industry Insights',
                      style: TextStyle(
                          fontFamily: 'Cinzel',
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 40),
                    Text(
                      "Explore our latest insights into today's most pressing business and technology trends.",
                      style: TextStyle(
                        fontFamily: 'Cinzel',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const InsightsSection(),
                  ],
                ),
              ),
            ),
          ),
          Footer(),
        ],
      ),
    );
  }
}
