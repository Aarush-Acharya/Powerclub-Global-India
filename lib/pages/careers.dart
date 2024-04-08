import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';
import '../widgets/drawer.dart';

class CareersPage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  CareersPage({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> jobList = [
    {
      "title": "Software Developer",
      "description": "Develop amazing software.",
      "skills": ["Dart", "Flutter", "Firebase"],
    },
    // Add more jobs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: _scaffoldKey,
          // Assuming CustomAppBar handles navigation and appearance based on the current theme
        ),
      ),
      drawer: CustomDrawer(), // Assuming CustomDrawer is correctly implemented
      body: SingleChildScrollView(
        child: Column(
          children: jobList.map((job) => buildJobCard(context, job)).toList(),
        ),
      ),
      bottomNavigationBar: Footer(), // Assuming Footer is correctly implemented
    );
  }

  Widget buildJobCard(BuildContext context, Map<String, dynamic> job) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(job["title"], style: Theme.of(context).textTheme.headline6),
            SizedBox(height: 10),
            Text(job["description"]),
            SizedBox(height: 10),
            Text("Skills Required:",
                style: Theme.of(context).textTheme.subtitle1),
            Wrap(
                children: job["skills"]
                    .map<Widget>((skill) => Chip(label: Text(skill)))
                    .toList()),
          ],
        ),
      ),
    );
  }
}
