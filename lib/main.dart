import 'package:flutter/material.dart';
import 'pages/food_encyclopedia.dart';
import 'pages/community.dart';
import 'pages/me.dart';
import 'pages/tabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder> {
    FoodEncyclopedia.tag: (context) => FoodEncyclopedia(),
    Community.tag: (context) => Community(),
    Me.tag: (context) => Me()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: routes,
      home: TabBarPage(),
    );
  }
}
