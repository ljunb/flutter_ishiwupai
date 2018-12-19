import 'package:flutter/material.dart';

class PlaceholderCell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Container(
      color: Colors.white,
      height: 110,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.only(right: 15, left: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: screen.width * 0.55,
                  height: 15,
                  color: const Color(0xFFCCCCCC)
                ),
                SizedBox(height: 5),
                Container(
                    width: screen.width * 0.1,
                    height: 15,
                    color: const Color(0xFFCCCCCC)
                ),
                SizedBox(height: 30),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                        width: 50,
                        height: 15,
                        color: const Color(0xFFCCCCCC)
                    ),
                    SizedBox(width: 10),
                    Container(
                        width: 30,
                        height: 15,
                        color: const Color(0xFFCCCCCC)
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: const Color(0xFFCCCCCC),
            width: (screen.width - 15 * 2 - 10 * 2) / 3,
            height: 80,
          )
        ],
      ),
    );
  }
}
