import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomAppBar({
    Key? key,
    required this.isDarkMode,
    required this.toggleDarkMode,
    required this.scaffoldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isWideScreen = MediaQuery.of(context).size.width >= 800; 

    // Define the underline color based on the theme
    Color underlineColor = isDarkMode ? Colors.white : Color(0xFFB4914C);

    return AppBar(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu, color: isDarkMode ? Colors.white : Colors.black),
        onPressed: () => scaffoldKey.currentState?.openDrawer(),
      ),
      title: isWideScreen
          ? Row(
              children: [
                GestureDetector(
                  onTap: ()=> Navigator.of(context).pushNamed('/') ,
                  child: Image.asset('assets/pcg${isDarkMode ? "_b" : ""}.png', height: 40.0),
                ),
                SizedBox(width: 20),
                TextButton(onPressed: ()=> Navigator.pushNamed(context, '/aboutUsPage'), child: Text("About Us", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black))),
                TextButton(onPressed: ()=> Navigator.pushNamed(context, '/servicesPage'), child: Text("Services", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black))),
                TextButton(onPressed: () => Navigator.pushNamed(context, '/contactUsPage'), child: Text("Contact Us", style: TextStyle(color: isDarkMode ? Colors.white : Colors.black))),
              ],
            )
          : GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed('/'),
              child: Center(child: Image.asset('assets/pcg${isDarkMode ? "_b" : ""}.png', height: 40.0)),
            ),
      actions: [
        IconButton(
          icon: Icon(isDarkMode ? Icons.wb_sunny : Icons.brightness_2, color: isDarkMode ? Colors.white : Colors.black),
          onPressed: toggleDarkMode,
        ),
      ],
      centerTitle: !isWideScreen,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(4.0),
        child: Container(
          color: underlineColor,
          height: 1.0,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 2.0); // Adjusted for the underline height
}
