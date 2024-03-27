import 'package:flutter/material.dart';
import 'package:pcg/theme/theme_manager.dart';
import 'package:pcg/widgets/drawer.dart';
import '../widgets/appbar.dart';
import '../widgets/footer.dart';

class IndustriesPage extends StatelessWidget {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Industries',
                style: Theme.of(context).textTheme.headline4,
              ),
              SizedBox(height: 20),
              Text(
                'We support a wide range of industries to build the next economy:',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              SizedBox(height: 10),
              _buildServiceItem(
                context,
                'Energy',
                'Innovative solutions for sustainable and renewable energy sources.',
                Icons.flash_on,
              ),
              _buildServiceItem(
                context,
                'Agriculture',
                'Technologies and strategies for modern, sustainable agriculture.',
                Icons.eco,
              ),
              _buildServiceItem(
                context,
                'Development',
                'Comprehensive land development and urban planning.',
                Icons.landscape,
              ),
              _buildServiceItem(
                context,
                'Transportation',
                'Efficient and sustainable transportation solutions.',
                Icons.directions_car,
              ),
              _buildServiceItem(
                context,
                'Networking',
                'Advanced networking solutions for ISPs and digital infrastructure.',
                Icons.router,
              ),
              _buildServiceItem(
                context,
                'Space',
                'Pioneering the final frontier with innovative space technologies.',
                Icons.rocket_launch,
              ),
              _buildServiceItem(
                context,
                'Robotics',
                'Cutting-edge robotics for automation, efficiency, and exploration.',
                Icons.build,
              ),
              _buildServiceItem(
                context,
                'Blockchain',
                'Secure, decentralized technologies for transactions and contracts.',
                Icons.account_balance_wallet,
              ),
              _buildServiceItem(
                context,
                'Hardware',
                'The latest in computer and IoT device technologies.',
                Icons.computer,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

  Widget _buildServiceItem(
      BuildContext context, String title, String subtitle, IconData icon) {
    return ListTile(
      leading: Icon(icon,
          color: themeManager.isDarkMode ? Colors.white : Colors.black),
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      subtitle: Text(subtitle),
    );
  }
}
