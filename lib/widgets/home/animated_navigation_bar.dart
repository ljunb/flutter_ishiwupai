import 'package:flutter/material.dart';
import './home_search_bar.dart';

class AnimatedNavigationBar extends StatefulWidget {
  AnimatedNavigationBar({Key key, this.opacity, this.controller})
      : super(key: key);

  final AnimatedNavigationBarController controller;
  final Animation opacity;

  @override
  State<StatefulWidget> createState() {
    return AnimatedNavigationBarState();
  }
}

class AnimatedNavigationBarState extends State<AnimatedNavigationBar> {
  AnimatedNavigationBarController _controller;

  @override
  Widget build(BuildContext context) {
    if (widget.controller == null) {
      _controller = AnimatedNavigationBarController();
      _controller.value.opacity = 0;
    } else {
      _controller = widget.controller;
    }

    final navBarHeight = MediaQuery.of(context).padding.top + 44;

    return Container(
      color: Color.fromRGBO(231, 139, 86, widget.controller.value.opacity),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Container(
            color: Color.fromRGBO(231, 139, 86, widget.controller.value.opacity),
            height: navBarHeight,
            width: MediaQuery.of(context).size.width,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 4),
            child: HomeSearchBarButton(),
          )
        ],
      ),
    );
  }
}

class AnimatedNavigationBarOpacityValue {
  double opacity;
}

class AnimatedNavigationBarController
    extends ValueNotifier<AnimatedNavigationBarOpacityValue> {
  AnimatedNavigationBarController()
      : super(AnimatedNavigationBarOpacityValue());
}
