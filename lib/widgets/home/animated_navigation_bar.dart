import 'package:flutter/material.dart';
import './home_search_bar.dart';

class AnimatedNavigationBar extends StatefulWidget {
  AnimatedNavigationBar(
      {Key key, this.onScan, this.onPress, this.controller}): super(key: key);

  final Function onPress;
  final Function onScan;
  final AnimatedNavigationBarController controller;

  @override
  State<StatefulWidget> createState() {
    return AnimatedNavigationBarState();
  }
}

class AnimatedNavigationBarState extends State<AnimatedNavigationBar> {
  AnimatedNavigationBarController _controller;

  _handlePress() {
    if (widget.controller.value.opacity <= 0.5) return;
    widget.onPress();
  }

  _handleScan() {
    if (widget.controller.value.opacity <= 0.5) return;
    widget.onScan();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      _controller = AnimatedNavigationBarController();
      _controller.value.opacity = 0;
    } else {
      _controller = widget.controller;
    }

    final navBarHeight = MediaQuery.of(context).padding.top + 44;
    return AnimatedOpacity(
      opacity: _controller.value.opacity,
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

class AnimatedNavigationBarController
    extends ValueNotifier<AnimatedNavigationBarStateValue> {
  AnimatedNavigationBarController() : super(AnimatedNavigationBarStateValue());
}

class AnimatedNavigationBarStateValue {
  double opacity;
}
