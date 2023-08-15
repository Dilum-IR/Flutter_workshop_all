import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'Pages/favourite.dart';
import 'Pages/profile.dart';
import 'Pages/search.dart';
import 'Pages/homePage.dart';

class BotomNavigationBar extends StatefulWidget {
  const BotomNavigationBar({super.key});

  @override
  _BotomNavigationBar createState() => _BotomNavigationBar();
}

class _BotomNavigationBar extends State<BotomNavigationBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const List<Widget> _mainPages = [
    HomePage(),
    Favourite(),
    Search(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Center(
        child: _mainPages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        // width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              backgroundColor: Colors.transparent,
              // rippleColor: Colors.grey[300]!,
              // hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.blue.withOpacity(0.5),
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  textColor: Colors.white,
                  iconColor: Color(0xff063970),
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                  textColor: Colors.white,
                  iconColor: Color(0xff063970),
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                  textColor: Colors.white,
                  iconColor: Color(0xff063970),
                ),
                GButton(
                  icon: Icons.person,
                  text: 'Profile',
                  textColor: Colors.white,
                  iconColor: Color(0xff063970),
                ),
              ],
              // selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
