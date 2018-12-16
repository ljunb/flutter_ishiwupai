import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({Key key, this.title, this.onPress});

  final String title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPress,
      child: Container(
        padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(2))),
        child: Text(
          this.title,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
