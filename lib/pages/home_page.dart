import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      appBar: _appBar(),
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
                _cardContent(),
                _transactionBox(),
                _cartBox(context),
                _menuTitle(),
                _gridMaker(),
              ],
            )),
      ),
      bottomNavigationBar: _navigationBar(),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      toolbarHeight: 80,
      leadingWidth: 170,
      leading: Container(
        margin: const EdgeInsets.only(left: 20),
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/main_logo.png'))),
      ),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 16.0),
          child: Icon(Icons.notifications_outlined),
        )
      ],
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

  Widget _cardContent() {
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

  // Transaction Section
  Widget _transactionBox() {
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

// Cart Section
  Widget _cartBox(BuildContext context) {
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

  Widget _navigationBar() {
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

  Widget _menuContent(Color color, String name, String imgPath) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.lerp(color, Colors.white, .4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(imgPath),
              ),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 12),
            ),
          ]),
    );
  }

  Widget _gridMaker() {
    List<Map> _menuItems = [
      {
        'color': 0xFFf8f2e6,
        'name': 'Tabungan Emas',
        'image': 'assets/images/image1.png',
      },
      {
        'color': 0xFFf8f2e6,
        'name': 'Cicil Emas',
        'image': 'assets/images/image2.png',
      },
      {
        'color': 0xFFe6f7ee,
        'name': 'Gadai (Rahn)',
        'image': 'assets/images/image3.png',
      },
      {
        'color': 0xFFe6ecf2,
        'name': 'Tabungan Emas',
        'image': 'assets/images/image4.png',
      },
      {
        'color': 0xFFe6ecf2,
        'name': 'Cicil Emas',
        'image': 'assets/images/image5.png',
      },
      {
        'color': 0xFFe6ecf2,
        'name': 'Gadai (Rahn)',
        'image': 'assets/images/image4.png',
      },
      {
        'color': 0xFFf8f2e6,
        'name': 'Tabungan Emas',
        'image': 'assets/images/image1.png',
      },
      {
        'color': 0xFFf8f2e6,
        'name': 'Cicil Emas',
        'image': 'assets/images/image2.png',
      },
      {
        'color': 0xFFe6f7ee,
        'name': 'Gadai (Rahn)',
        'image': 'assets/images/image3.png',
      },
      {
        'color': 0xFFe6ecf2,
        'name': 'Tabungan Emas',
        'image': 'assets/images/image4.png',
      },
      {
        'color': 0xFFe6ecf2,
        'name': 'Cicil Emas',
        'image': 'assets/images/image5.png',
      },
      {
        'color': 0xFFe6ecf2,
        'name': 'Gadai (Rahn)',
        'image': 'assets/images/image4.png',
      },
    ];

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: GridView.builder(
            controller: _scrollController,
            itemCount: _menuItems.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: _deviceWidth! * .03,
              crossAxisSpacing: _deviceWidth! * .03,
            ),
            itemBuilder: (BuildContext ctx, int index) {
              return _menuContent(
                Color(_menuItems[index]['color']),
                _menuItems[index]['name'],
                _menuItems[index]['image'],
              );
            }),
      ),
    );
  }
}
