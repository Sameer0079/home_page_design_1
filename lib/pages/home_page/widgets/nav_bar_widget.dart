import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageNavBar extends StatefulWidget {
  HomePageNavBar({super.key});
  int? _currentIndex = 0;

  @override
  State<HomePageNavBar> createState() => _HomePageNavBarState();
}

class _HomePageNavBarState extends State<HomePageNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget._currentIndex!,
      onTap: (value) {
        setState(() {
          widget._currentIndex = value;
        });
      },
      selectedFontSize: 12,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), label: 'Beranda'),
        BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.text_badge_checkmark), label: 'Riwayat'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Profile')
      ],
    );
  }
}
