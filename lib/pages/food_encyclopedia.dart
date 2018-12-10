import 'package:flutter/material.dart';
import '../widgets/home_search_bar.dart';

class FoodEncyclopedia extends StatefulWidget {
  static String tag = 'food_encyclopedia_page';

  @override
  _FoodEncyclopediaState createState() => _FoodEncyclopediaState();
}

class _FoodEncyclopediaState extends State<FoodEncyclopedia>
    with AutomaticKeepAliveClientMixin<FoodEncyclopedia> {
  @override
  bool get wantKeepAlive => true;

  _handleClickSearchBar() {
    print('handle');
  }

  _handleClickScanBtn() {
    print('scan');
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screen = MediaQuery.of(context).size;
    final iphoneXNavHeight = MediaQuery.of(context).padding.top;
    final imgHeight = 240 + iphoneXNavHeight;

    final topImage = Stack(
      children: <Widget>[
        Image.asset('assets/img_home_bg.png',
            height: imgHeight, width: screen.width, fit: BoxFit.cover),
        Container(
          width: screen.width,
          height: imgHeight,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(height: iphoneXNavHeight + 5),
              Image.asset('assets/ic_head_logo.png', height: 22, width: 60),
              Container(height: 80),
              Text(
                '查 询 食 物 信 息',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200),
              ),
              Container(height: 32),
              HomeSearchBarButton(
                onPress: _handleClickSearchBar,
                onScan: _handleClickScanBtn,
              )
            ],
          ),
        )
      ],
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[topImage],
        ),
      ),
    );
  }
}
