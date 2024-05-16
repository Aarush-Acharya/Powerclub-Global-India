import 'package:flutter/material.dart';
import 'package:pcg/widgets/drawer.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.white,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
      ),
      home: const VslPage(),
    );
  }
}

class VslPage extends StatelessWidget {
  const VslPage({Key? key}) : super(key: key);

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
              HeaderSection(),
              const SizedBox(height: 16.0),
              MainOfferSection(),
              const SizedBox(height: 16.0),
              TestimonialSection(),
              const SizedBox(height: 16.0),
              BonusOfferSection(),
              const SizedBox(height: 16.0),
              NoCatchSection(),
              const SizedBox(height: 16.0),
              UrgencySection(),
              const SizedBox(height: 16.0),
              GuaranteeSection(),
              const SizedBox(height: 16.0),
              TotalValueSection(),
              const SizedBox(height: 16.0),
              FinalCtaSection(),
              const SizedBox(height: 16.0),
              const Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Color color;
  final Widget child;
  final Color textColor;

  const RoundedContainer(
      {Key? key,
      required this.color,
      required this.child,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      child: Center(
        child: DefaultTextStyle(
          style: TextStyle(color: textColor),
          child: child,
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.white,
      textColor: Colors.black,
      child: Column(
        children: [
          Text(
            'Powerclub Global Presents:',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Unlock the Secrets to Scaling Your Business with Video Sales Letters',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class MainOfferSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Color(0xFFB4914C),
      textColor: Colors.white,
      child: Column(
        children: [
          Text(
            'Get Your FREE VSL Strategy Session!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Container(
            height: 200.0,
            color: Colors.white,
            child: Center(child: Text('VSL Video Placeholder')),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Discover how our VSLs can transform your business. Schedule a free strategy session with our experts.',
            style: TextStyle(
              fontSize: 16.0,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Schedule Your Free Session Now'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.grey[200]!,
      textColor: Colors.black,
      child: Column(
        children: [
          Text(
            'Our Satisfied Clients:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/forbes.png', height: 40.0),
              Image.asset('assets/inc.png', height: 40.0),
              Image.asset('assets/bloomberg.png', height: 40.0),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            '"Our sales increased by 50% after using Powerclub Global\'s VSLs." - Timeless Roofing',
            style: TextStyle(
              fontSize: 16.0,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class BonusOfferSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Color(0xFFB4914C),
      textColor: Colors.white,
      child: Column(
        children: [
          Text(
            'Claim Your FREE Bonuses!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Bonus #1 - 10k in 10 Days Challenge',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 150.0,
            color: Colors.white,
            child: Center(child: Text('Bonus #1 Content Placeholder')),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Bonus #2 - VIP Mindset Program',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 150.0,
            color: Colors.white,
            child: Center(child: Text('Bonus #2 Content Placeholder')),
          ),
          const SizedBox(height: 16.0),
          Text(
            'Bonus #3 - Free Strategy Call',
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 150.0,
            color: Colors.white,
            child: Center(child: Text('Bonus #3 Content Placeholder')),
          ),
        ],
      ),
    );
  }
}

class NoCatchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.grey[200]!,
      textColor: Colors.black,
      child: Column(
        children: [
          Text(
            'There is NO CATCH!',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'We\'re offering this free strategy session because we know how effective our VSLs are. There\'s no hidden fee or obligation.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class UrgencySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Color(0xFFB4914C),
      textColor: Colors.white,
      child: Column(
        children: [
          Text(
            'Time Is Of The Essence...',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'We can only offer a limited number of free strategy sessions each month. Don\'t miss out on this opportunity!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class GuaranteeSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.grey[200]!,
      textColor: Colors.black,
      child: Column(
        children: [
          Text(
            'Here Is My "You\'ve Gotta Be Crazy" Guarantee',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'We stand by our VSLs. If you\'re not satisfied after the strategy session, we\'ll work with you until you are.',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class TotalValueSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Color(0xFFB4914C),
      textColor: Colors.white,
      child: Column(
        children: [
          Text(
            'Total Value: \$4999',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Get your VSL package and all the bonuses for a fraction of the cost!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class FinalCtaSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      color: Colors.grey[200]!,
      textColor: Colors.black,
      child: Column(
        children: [
          Text(
            'This Is Truly A Limited Offer, So Claim Your FREE Strategy Session Now Before They\'re All Gone...',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          Text(
            'Get your free strategy session and discuss your VSL needs!',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('Reserve My Free Strategy Session Now'),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.redAccent,
              textStyle: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
