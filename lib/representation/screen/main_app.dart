import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:booking_app_source/core/constants/color_palatte.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:booking_app_source/representation/screen/profile_screen.dart';
import 'package:booking_app_source/representation/screen/settings_screen.dart';

import '../../core/constants/dimension_constants.dart';
import 'home_screen.dart';

class MainApp extends StatefulWidget {
  const MainApp({Key? key}) : super(key: key);

  static const routeName = '/main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(
          () => _currentIndex = i,
        ),
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.2),
        selectedColorOpacity: 0.2,
        margin: const EdgeInsets.symmetric(horizontal: kMediumPadding, vertical: kDefaultPadding),
        items: [
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: kDefaultPadding,
            ),
            title: const Text("Home"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidHeart,
              size: kDefaultPadding,
            ),
            title: const Text("Likes"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.cog,
              size: kDefaultPadding,
            ),
            title: const Text("Setting"),
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultPadding,
            ),
            title: const Text("Profile"),
          ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const HomeScreen(),
          Container(),
          const MySettings(),
          const MyProfile(),
        ],
      ),
    );
  }
}
