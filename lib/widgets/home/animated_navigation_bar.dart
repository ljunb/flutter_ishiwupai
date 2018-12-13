import 'package:flutter/material.dart';
import './home_search_bar.dart';

class AnimatedNavigationBar extends StatelessWidget {
  AnimatedNavigationBar({Key key, this.opacity, this.onScan, this.onPress});
  final double opacity;
  final Function onPress;
  final Function onScan;

  _handlePress() {
    if (this.opacity <= 0.5) return;
    this.onPress();
  }

  _handleScan() {
    if (this.opacity <= 0.5) return;
    this.onScan();
  }

  @override
  Widget build(BuildContext context) {
    final navBarHeight = MediaQuery.of(context).padding.top + 44;
    return AnimatedOpacity(
      opacity: this.opacity,
      duration: Duration(milliseconds: 100),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Color.fromRGBO(231, 139, 86, 1),
            height: navBarHeight,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: HomeSearchBarButton(
              onPress: _handlePress,
              onScan: _handleScan,
            ),
          )
        ],
      ),
    );
  }
}
