import 'package:flutter/material.dart';
import 'food_encyclopedia.dart';
import 'community.dart';
import 'me.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBarPage> {
  int _selectedIndex = 0;
  var _tabImages;
  final _tabTitles = ['食物百科', '逛吃', '我的'];
  var _tabPages;

  Image getTabImage(path) => Image.asset(path, width: 20.0, height: 20.0);

  Image getTabIcon(int index) {
    if (index == _selectedIndex) {
      return _tabImages[index][1];
    }
    return _tabImages[index][0];
  }

  Text getTabTitle(int index) {
    if (index == _selectedIndex) {
      return Text(_tabTitles[index], style: TextStyle(color: Colors.orange));
    }
    return Text(_tabTitles[index], style: TextStyle(color: Colors.grey));
  }

  initData() {
    _tabImages = [
      [
        getTabImage('assets/ic_tab_homepage.png'),
        getTabImage('assets/ic_tab_homepage_select.png')
      ],
      [
        getTabImage('assets/ic_tab_shop.png'),
        getTabImage('assets/ic_tab_shop_select.png')
      ],
      [
        getTabImage('assets/ic_tab_my.png'),
        getTabImage('assets/ic_tab_my_select.png')
      ]
    ];
    _tabPages = [FoodEncyclopedia(), Community(), Me()];
  }

  @override
  Widget build(BuildContext context) {
    initData();

    return Scaffold(
      body: _tabPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2))
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
