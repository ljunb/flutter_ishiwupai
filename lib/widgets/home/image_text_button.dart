import 'package:flutter/material.dart';

class ImageTextButton extends StatelessWidget {
  ImageTextButton({Key key, this.icon, this.title, this.onPress});

  final Widget icon;
  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: Column(
          children: <Widget>[
            this.icon,
            Text(this.title, style: TextStyle(fontSize: 13, color: Colors.grey))
          ],
        ),
      ),
      onTap: this.onPress,
    );
  }
}
