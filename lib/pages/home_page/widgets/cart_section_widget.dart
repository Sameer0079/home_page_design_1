import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePageCartSection extends StatelessWidget {
  HomePageCartSection({super.key});
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
          top: _deviceWidth! * .06, bottom: _deviceWidth! * .06),
      width: _deviceWidth,
      padding: EdgeInsets.symmetric(
        horizontal: _deviceWidth! * .10,
        vertical: _deviceWidth! * .04,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: const Offset(
              0.0,
              1.0,
            ),
            blurRadius: 2.0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: _cartContent(
                  Colors.green.shade600, CupertinoIcons.cart_badge_plus)),
          SizedBox(
              height: _deviceHeight! * .06, child: const VerticalDivider()),
          Expanded(
              child: _cartContent(
                  Colors.blue.shade800, CupertinoIcons.cart_badge_minus))
        ],
      ),
    );
  }

  Widget _cartContent(Color color, IconData iconData) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 30,
          color: color,
        ),
        const Text(
          'Beli Emas',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
