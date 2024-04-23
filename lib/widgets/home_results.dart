import 'package:flutter/material.dart';
import 'package:pcg/widgets/blog_box.dart';
import 'package:pcg/widgets/home_insights.dart';

class ResultsSection extends StatelessWidget {
  const ResultsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width > 800;

    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            "Championing the Bold to Achieve the Extraordinary",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 15),
          Text(
            "See how we have helped ambitious clients achieve extraordinary outcomes",
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 40),
          isDesktop
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      BlogBox(), // Assuming BlogBox is a widget you've defined
                      SizedBox(width: 30),
                      BlogBox(),
                    ],
                  ),
                )
              : Column(
                  children: const [
                    BlogBox(),
                    SizedBox(height: 16),
                    BlogBox(),
                  ],
                ),
          SizedBox(height: 25),
          ElevatedButton(
            onPressed: () {
              // Define what happens when the button is pressed
              // For example, navigate to a page showing client results
              Navigator.of(context)
                  .pushNamed('/clientsResults'); // Adjust the route as needed
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Color(0xFFB4914C), // Background color of the button
              foregroundColor: Colors.white, // Text color of the button
            ),
            child: Text('See our Clients Results'),
          ),
        ],
      ),
    );
  }
}
