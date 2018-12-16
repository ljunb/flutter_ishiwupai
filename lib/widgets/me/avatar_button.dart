import 'package:flutter/material.dart';

class AvatarButton extends StatelessWidget {
  AvatarButton({Key key, this.icon, this.onPress});

  final Widget icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        height: 90,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 5),
            borderRadius: BorderRadius.all(Radius.circular(45))),
        child: this.icon,
      ),
    );
  }
}
