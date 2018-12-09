import 'package:flutter/material.dart';

class FoodEncyclopedia extends StatefulWidget {
  static String tag = 'food_encyclopedia_page';

  @override
  _FoodEncyclopediaState createState() => _FoodEncyclopediaState();
}

class _FoodEncyclopediaState extends State<FoodEncyclopedia>
    with AutomaticKeepAliveClientMixin<FoodEncyclopedia> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Center(
      child: Text('食物百科'),
    );
  }
}
