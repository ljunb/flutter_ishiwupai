import 'package:flutter/material.dart';

class FoodEncyclopedia extends StatefulWidget {
  static String tag = 'food_encyclopedia_page';

  @override
  _FoodEncyclopediaState createState() => _FoodEncyclopediaState();
}

class _FoodEncyclopediaState extends State<FoodEncyclopedia> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final content = Center(
      child: Container(
        color: Colors.white,
        child: Text('食物百科')
      ),
    );

    return Scaffold(
      body: content,
    );
  }
}