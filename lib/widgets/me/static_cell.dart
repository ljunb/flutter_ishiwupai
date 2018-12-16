import 'package:flutter/material.dart';

enum StaticCellType {
  Photos,
  Favorites,
  Upload
}

class StaticCell extends StatelessWidget {
  StaticCell({Key key, this.iconSource, this.title, this.type, this.onPress});

  final String iconSource;
  final String title;
  final StaticCellType type;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => this.onPress(this.type),
      child: Column(
        children: <Widget>[
          Container(
            height: 46,
            color: Colors.white,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 16),
            child: Container(
              child: Row(
                children: <Widget>[
                  Image.asset(this.iconSource, width: 20, height: 20),
                  SizedBox(width: 16),
                  Text(this.title, style: TextStyle(color: Colors.grey))
                ],
              ),
            ),
          ),
          Divider(
            color: Color(0xffd9d9d9),
            indent: 32 + 20.0,
            height: 0,
          )
        ],
      ),
    );
  }
}
