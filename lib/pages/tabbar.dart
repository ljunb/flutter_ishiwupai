import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'food_encyclopedia.dart';
import 'community.dart';
import 'me.dart';
import '../widgets/tab_item.dart';

class TabBarPage extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBarPage> {
  PageController _pageController;
  List<TabItem> _tabItems;
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

  static Image getIcon(path) => Image.asset(path, width: 20.0, height: 20.0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    setupTabItems();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  setupTabItems() {
    _tabItems = _tapOptions
        .map((tabItem) => TabItem(
              title: tabItem['title'],
              icon: tabItem['icon'],
              activeIcon: tabItem['icon_select'],
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final body = PageView.builder(
      itemBuilder: (BuildContext context, int index) => _pages[index],
      controller: _pageController,
      itemCount: _pages.length,
      physics: NeverScrollableScrollPhysics(),
    );

    final btmNavBar = BottomNavigationBar(
        fixedColor: Colors.orange,
        items: _tabItems.map((tab) => tab.item).toList(),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() {
              _selectedIndex = index;
              _pageController.jumpToPage(index);

              final overlayStyle = index == 1
                  ? SystemUiOverlayStyle.dark
                  : SystemUiOverlayStyle.light;
              SystemChrome.setSystemUIOverlayStyle(overlayStyle);
            }));

    return Scaffold(
      body: body,
      bottomNavigationBar: btmNavBar,
    );
  }
}
