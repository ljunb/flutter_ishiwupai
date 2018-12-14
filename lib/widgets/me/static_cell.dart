import 'package:flutter/material.dart';

class StaticCell extends StatelessWidget {
  StaticCell({Key key, this.iconSource, this.title, this.onPress});

  final String iconSource;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        height: 46,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Image.asset(this.iconSource, width: 20, height: 20),
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 46,
                  width: MediaQuery.of(context).size.width - 16 * 2 - 20,
                  alignment: Alignment.centerLeft,
//                  decoration: const BoxDecoration(
//                      border: Border(
//                          bottom: BorderSide(color: Color(0xffd9d9d9), width: 1)
//                      )
//                  ),
                  child: Text(this.title, style: TextStyle(color: Colors.grey)),
                ),
//Container(height: 2, color: Colors.red,)
                Divider(color: Color(0xffd9d9d9), height: 1,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}