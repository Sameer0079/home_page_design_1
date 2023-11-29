import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCardContent extends StatelessWidget {
  HomePageCardContent({super.key});
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      foregroundDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          backgroundBlendMode: BlendMode.overlay,
          gradient: const LinearGradient(
            colors: [
              Color(0xFFb1e4bf),
              Color(0xFFb1e4bf),
              Color(0xFFb1e4bf),
              Color(0xFFb1e4bf),
            ],
            stops: [0.1, 0.5, 0.7, 0.9],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/card_pattern.jpeg')),
      ),
      padding: EdgeInsets.all(_deviceWidth! * .05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _cardUpperText(),
          const SizedBox(height: 20),
          _cardMainText(),
          const SizedBox(height: 7),
          _cardMiddleText(),
          const SizedBox(height: 40),
          _cardBottomText(),
        ],
      ),
    );
  }

  Widget _cardUpperText() {
    return const Text(
      'Tabungan Emas',
      style: TextStyle(fontWeight: FontWeight.w600),
    );
  }

  Widget _cardMainText() {
    return const Row(
      children: [
        Text(
          'Rp 1.290.922',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(width: 10),
        Icon(CupertinoIcons.eye_fill)
      ],
    );
  }

  Widget _cardMiddleText() {
    return const Text(
      '1,17400 gram',
      style: TextStyle(
          fontWeight: FontWeight.w400, color: Color(0xFF0b6e37), fontSize: 16),
    );
  }

  Widget _cardBottomText() {
    return const Text(
      'Terakir update: 25/05/2023, pukul 16.25',
      style: TextStyle(
          fontSize: 10, fontWeight: FontWeight.w900, color: Color(0xFF0b6e37)),
    );
  }
}
