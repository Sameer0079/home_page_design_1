import 'package:flutter/material.dart';

class HomePageTransactionSection extends StatelessWidget {
  HomePageTransactionSection({super.key});
  double? _deviceHeight, _deviceWidth;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(top: _deviceWidth! * .06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          _transactionType(
            icon: Icons.arrow_drop_down,
            color: Colors.red.shade600,
          ),
          _transactionType(
            icon: Icons.arrow_drop_up,
            color: Colors.green.shade600,
          )
        ],
      ),
    );
  }

  Widget _transactionType({required IconData icon, required Color color}) {
    return Column(
      children: [
        Text(
          'Harga Beli Saat ini/g',
          style: TextStyle(color: Colors.grey.shade700, fontSize: 10),
        ),
        Row(
          children: [
            const Text(
              'Rp 991.721',
              style: TextStyle(fontSize: 14),
            ),
            Icon(icon, color: color),
          ],
        )
      ],
    );
  }
}
