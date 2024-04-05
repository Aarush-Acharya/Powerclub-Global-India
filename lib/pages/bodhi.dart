import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:pcg/widgets/linktree.dart';
import '../widgets/contact_form.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class Bodhi extends StatelessWidget {
  const Bodhi({Key? key}) : super(key: key);

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
              LinkTreeWidget(
                assetPath: 'assets/images/bodhi.jpg',
                name: 'Jessy Bodhi Artman',
                links: [],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
