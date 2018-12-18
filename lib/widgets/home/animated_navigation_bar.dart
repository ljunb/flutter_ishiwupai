import 'package:flutter/material.dart';
import './home_search_bar.dart';

class AnimatedNavigationBar extends StatefulWidget {
  AnimatedNavigationBar({Key key, this.onScan, this.onPress}) : super(key: key);

  final Function onPress;
  final Function onScan;

  @override
  State<StatefulWidget> createState() {
    return AnimatedNavigationBarState();
  }
}

class AnimatedNavigationBarState extends State<AnimatedNavigationBar> {
  double _opacity = 0;

  updateOpacity(double opacity) => setState(() => _opacity = opacity);

  _handlePress() {
    if (_opacity <= 0.5) return;
    widget.onPress();
  }

  _handleScan() {
    if (_opacity <= 0.5) return;
    widget.onScan();
  }

  @override
  Widget build(BuildContext context) {
    final navBarHeight = MediaQuery.of(context).padding.top + 44;
    return AnimatedOpacity(
      opacity: _opacity,
      duration: Duration(milliseconds: 100),
      child: Container(
        color: Color.fromRGBO(231, 139, 86, 1),
        height: navBarHeight,
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.only(bottom: 4),
        child: HomeSearchBarButton(
          onPress: _handlePress,
          onScan: _handleScan,
        ),
      ),
    );
  }
}
