import 'package:flutter/material.dart';
import './home_search_bar.dart';

class AnimatedNavigationBar extends StatelessWidget {
  AnimatedNavigationBar({Key key, this.opacity});

  final double opacity;

  @override
  Widget build(BuildContext context) {
    final navBarHeight = MediaQuery.of(context).padding.top + 44;

    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          color: Color.fromRGBO(231, 139, 86, this.opacity),
          height: navBarHeight,
          width: MediaQuery.of(context).size.width,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 4),
          child: HomeSearchBarButton(),
        )
      ],
    );
  }
}
