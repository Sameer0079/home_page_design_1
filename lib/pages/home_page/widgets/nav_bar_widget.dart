import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageNavBar extends StatelessWidget {
  const HomePageNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      indicatorColor: Colors.transparent,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
        NavigationDestination(
            icon: Icon(CupertinoIcons.text_badge_checkmark), label: 'Riwayat'),
        NavigationDestination(
            icon: Icon(Icons.person_outline), label: 'Profile'),
      ],
    );
  }
}
