import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import '../widgets/contact_form.dart';
import '../widgets/appbar.dart'; 
import '../widgets/footer.dart'; 

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ContactForm(),
              Footer()
            ],
          ),
        ),
      ),
    );
  }
}
