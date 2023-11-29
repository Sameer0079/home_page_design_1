import 'package:flutter/material.dart';
import 'package:home_page_design_1/pages/home_page/widgets/app_bar_widget.dart';
import 'package:home_page_design_1/pages/home_page/widgets/card_content_widget.dart';
import 'package:home_page_design_1/pages/home_page/widgets/cart_section_widget.dart';
import 'package:home_page_design_1/pages/home_page/widgets/menu_section_widget.dart';
import 'package:home_page_design_1/pages/home_page/widgets/transaction_section_widget.dart';
import 'widgets/nav_bar_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  double? _deviceHeight, _deviceWidth;
  ScrollController? _scrollController;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _scrollController = ScrollController();

    return Scaffold(
      appBar: const HomePageAppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        controller: _scrollController,
        child: Container(
            height: _deviceHeight,
            margin: EdgeInsets.symmetric(horizontal: _deviceWidth! * .05),
            width: _deviceWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title(),
                HomePageCardContent(),
                HomePageTransactionSection(),
                HomePageCartSection(),
                _menuTitle(),
                HomePageMenuSection(scrollController: _scrollController!),
              ],
            )),
      ),
      bottomNavigationBar: HomePageNavBar(),
    );
  }

  Widget _title() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        'Selamat Pagi, Ihsan!',
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Color(0xFF003d35)),
      ),
    );
  }

  Widget _menuTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              'Layanan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Text('Semua layanan',
              style: TextStyle(
                  color: Color(0xFF496a5c), fontWeight: FontWeight.w700)),
          Icon(Icons.keyboard_arrow_right, color: Color(0xFF496a5c))
        ],
      ),
    );
  }
}
