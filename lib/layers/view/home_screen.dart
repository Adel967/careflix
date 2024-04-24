import 'package:careflix/core/configuration/styles.dart';
import 'package:careflix/layers/view/coming_soon_show/coming_soon_show.dart';
import 'package:careflix/layers/view/lists_screen/lists_screen.dart';
import 'package:careflix/layers/view/search_screen/search_screen.dart';
import 'package:careflix/layers/view/settings/settings_screen.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final screens = [
    ListsScreen(),
    SearchScreen(),
    ComingSoonShow(),
    SettingsScreen(),
  ];

  _handleIndexChanged(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 25,
              offset: const Offset(8, 20)),
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed, // Fixed
                backgroundColor: Styles.colorPrimary
                    .withOpacity(0.9), // <-- This works for fixed
                showUnselectedLabels: false,
                selectedItemColor: Styles.ColorGradient2,
                unselectedItemColor: Colors.grey.shade400,
                currentIndex: index,
                onTap: _handleIndexChanged,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: S.of(context).home,
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.search), label: S.of(context).search),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.connected_tv),
                      label: S.of(context).comingSoon),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: S.of(context).settings),
                ]),
          ),
        ),
      ),
      body: screens[index],
    );
  }
}
