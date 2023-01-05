import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../../generated/l10n.dart';
import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';
import '../settings_screen/settings_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedPage = 1;

  void onSelectPage(int index) {
    setState(
      () {
        _selectedPage = index;
      },
    );
  }

  static final List<Widget> _widgetOptions = <Widget>[
    const SettingsScreen(),
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.white,
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_outlined, color: Colors.black,)),
        title: Text(
          S.of(context).myCodes,
          style: const TextStyle(fontSize: 24, color: Colors.black),
        ),
        actions: [
          Center(
            child: Stack(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Colors.black,
                  size: 40,
                ),
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xffc32c37),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: const Padding(
                      padding: EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                          '1',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedPage),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10),
            decoration: const BoxDecoration(
              color: Color(0xFF211F1F),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.black,
              color: Colors.white,
              backgroundColor: const Color(0xFF211F1F),
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: const Color(0xFFCDC1FF),
              tabs: [
                GButton(
                  icon: Icons.settings,
                  text: S.of(context).settings,
                ),
                GButton(
                  icon: Icons.qr_code,
                  text: S.of(context).myCodes,
                ),
                GButton(
                  icon: Icons.person_rounded,
                  text: S.of(context).profile,
                ),
              ],
              selectedIndex: _selectedPage,
              onTabChange: onSelectPage,
            ),
          ))),
    );
  }
}
