import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/home_search_bar.dart';
import '../widgets/home_food_section_view.dart';

class FoodEncyclopedia extends StatefulWidget {
  static String tag = 'food_encyclopedia_page';

  @override
  _FoodEncyclopediaState createState() => _FoodEncyclopediaState();
}

class _FoodEncyclopediaState extends State<FoodEncyclopedia>
    with AutomaticKeepAliveClientMixin<FoodEncyclopedia> {
  @override
  bool get wantKeepAlive => true;

  var _foodGroup = [];

  @override
  initState() {
    super.initState();
    _fetchHomeData();
  }

  _fetchHomeData() async {
    try {
      const url = 'http://food.boohee.com/fb/v1/categories/list';
      http.Response response = await http.get(url);
      if (response.statusCode != 200) {
        print("[首页] 请求出错：" + response.statusCode.toString());
        return;
      }

      var map = json.decode(response.body);
      setState(() => _foodGroup = map['group']);
    } catch (e) {
      print(e.toString());
    }
  }

  _handleClickSearchBar() {
    print('handle');
  }

  _handleClickScanBtn() {
    print('scan');
  }

  _handleClickCategoryItem(var category) {
    print(category.toString());
  }

  _buildFoodSection() {
    List<Widget> foodGroup = [];
    for (var group in _foodGroup) {
      foodGroup.add(HomeFoodSectionView(
        group: group,
        onClickCategory: _handleClickCategoryItem,
      ));
    }
    return Column(children: foodGroup);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final screen = MediaQuery.of(context).size;
    final iphoneXNavHeight = MediaQuery.of(context).padding.top;
    final imgHeight = 220 + iphoneXNavHeight;

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
              Image.asset('assets/ic_head_logo.png', height: 24, width: 66),
              Container(height: 60),
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

    final foodSection = _buildFoodSection();
    final contentWrp = Container(
      margin: const EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[foodSection],
      ),
    );

    return Container(
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[topImage, contentWrp],
        ),
      ),
    );
  }
}
