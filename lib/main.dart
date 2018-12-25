import 'package:flutter/material.dart';
import 'pages/food_encyclopedia.dart';
import 'pages/feed.dart';
import 'pages/me.dart';
import 'pages/tabbar.dart';
import 'pages/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder> {
    FoodEncyclopedia.tag: (BuildContext context) => FoodEncyclopedia(),
    Feed.tag: (BuildContext context) => Feed(),
    Me.tag: (BuildContext context) => Me(),
    Search.tag: (BuildContext context) => Search()
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
