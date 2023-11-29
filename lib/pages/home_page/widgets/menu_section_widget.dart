import 'package:flutter/material.dart';

class HomePageMenuSection extends StatelessWidget {
  ScrollController scrollController;
  double? _deviceHeight, _deviceWidth;

  HomePageMenuSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

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
        child: Scrollbar(
          controller: scrollController,
          radius: const Radius.circular(3.0),
          thickness: 2.0,
          child: GridView.builder(
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
      ),
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
}
