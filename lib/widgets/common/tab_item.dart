import 'package:flutter/material.dart';

class TabItem {
  final String _title;
  final Widget _icon;
  final Widget _activeIcon;
  final BottomNavigationBarItem item;

  TabItem({Key key, String title, Widget icon, Widget activeIcon})
      : _title = title,
        _icon = icon,
        _activeIcon = activeIcon,
        item = BottomNavigationBarItem(
            title: Text(title),
            icon: icon,
            activeIcon: activeIcon,
            backgroundColor: Colors.white);
}
