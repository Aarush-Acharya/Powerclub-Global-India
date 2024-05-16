import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class Branding extends StatelessWidget {
  const Branding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(
          scaffoldKey: _scaffoldKey,
        ),
      ),
      drawer: CustomDrawer(),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
