import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import 'package:pcg/widgets/linktree.dart';
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
                assetPath: 'bodhi.png',
                name: 'Jessy Bodhi Artman',
                contact: 'bodhi@powerclubglobal.com',
                links: [
                  LinkButton(
                      title: 'Website', url: 'https://www.powerclubglobal.com'),
                  LinkButton(
                      title: 'LinkedIn',
                      url: 'https://www.linkedin.com/in/jessy-artman-740b9a94'),
                  LinkButton(
                      title: 'Instagram',
                      url: 'https://www.instagram.com/jessyartman/'),
                  LinkButton(
                      title: 'X', url: 'https://twitter.com/JessyArtman'),
                ],
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}
