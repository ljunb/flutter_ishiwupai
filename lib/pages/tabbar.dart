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
  final _pages = [FoodEncyclopedia(), Community(), Me()];
  final _tapOptions = [
    {
      'title': '食物百科',
      'icon': getIcon('assets/ic_tab_homepage.png'),
      'icon_select': getIcon('assets/ic_tab_homepage_select.png')
    },
    {
      'title': '逛吃',
      'icon': getIcon('assets/ic_tab_shop.png'),
      'icon_select': getIcon('assets/ic_tab_shop_select.png')
    },
    {
      'title': '我的',
      'icon': getIcon('assets/ic_tab_my.png'),
      'icon_select': getIcon('assets/ic_tab_my_select.png')
    }
  ];

  static Image getIcon(path) =>
      new Image.asset(path, width: 20.0, height: 20.0);

  @override
  Widget build(BuildContext context) {
    final items = _tapOptions.map((var tab) {
      final index =
          _tapOptions.indexWhere((ele) => ele['title'] == tab['title']);
      final textStyle = index == _selectedIndex
          ? TextStyle(fontSize: 12, color: Colors.orange)
          : TextStyle(fontSize: 12, color: Colors.grey);

      return BottomNavigationBarItem(
        title: Text(tab['title'], style: textStyle),
        icon: tab['icon'],
        activeIcon: tab['icon_select'],
      );
    }).toList();

    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: items,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index)),
    );
  }
}
