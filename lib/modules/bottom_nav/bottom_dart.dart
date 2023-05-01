import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:coza_app/modules/browse/browse_screen.dart';
import 'package:coza_app/modules/home/home_screen.dart';
import 'package:coza_app/modules/library/library_screen.dart';
import 'package:coza_app/modules/search/search_screen.dart';
import 'package:coza_app/utils/bottom_nav_icons_icons.dart';
import 'package:coza_app/utils/bottom_nav_icons_icons.dart';
import 'package:coza_app/utils/bottom_nav_icons_icons.dart';
import 'package:coza_app/utils/bottom_nav_icons_icons.dart';
import 'package:coza_app/utils/bottom_nav_icons_icons.dart';
import 'package:coza_app/utils/custom_icons_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/color_palette.dart';
import '../live/live_screen.dart';

class BottomNav extends StatefulWidget {
  BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int visit = 0;
  double height = 30;
  List<TabItem> items = [
   const TabItem(
      icon: BottomNavIcons.home_icon,
      title: 'Home',
    ),
   const TabItem(
      icon: BottomNavIcons.browse_icon,
      title: 'Browse',
    ),
   const TabItem(
      icon: BottomNavIcons.live_icon,
      title: 'Live',
    ),
   const TabItem(
      icon: BottomNavIcons.search_icon,
      title: 'Search',
    ),
   const TabItem(
      icon: BottomNavIcons.library_icon,
      title: 'Library',
    ),
  ];

  List<Widget> pages = [
    HomeScreen(),
    BrowseScreen(),
    LiveScreen(),
    SearchScreen(),
    LibraryScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[visit],
      bottomNavigationBar: BottomBarDefault(
        items: items,
        backgroundColor: Colors.white,
        color: Colors.grey,
        indexSelected: visit,
        colorSelected: primaryColor,
        onTap: (int index) {
          setState(() {
            visit = index;
          });
        },
      ),
    );
  }
}
