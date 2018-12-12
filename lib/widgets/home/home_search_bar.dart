import 'package:flutter/material.dart';

class HomeSearchBarButton extends StatelessWidget {
  HomeSearchBarButton({Key key, @required this.onPress, @required this.onScan});

  final Function onPress;
  final Function onScan;

  @override
  Widget build(BuildContext context) {
    final searchContent = Row(
      children: <Widget>[
        Image.asset('assets/ic_home_search.png', height: 20, width: 20),
        Container(width: 8),
        Text('请输入食物名称', style: TextStyle(color: Colors.orange, fontSize: 15)),
      ],
    );

    final scanBtn = GestureDetector(
      child: Image.asset('assets/ic_scan.png',
          height: 34, width: 34, color: Colors.black),
      onTap: this.onScan,
    );

    final content = Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 5, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[searchContent, scanBtn],
        ));

    return GestureDetector(
        onTap: this.onPress,
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 16 * 2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(4.0))),
            child: content));
  }
}
