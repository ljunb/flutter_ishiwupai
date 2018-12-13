import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../widgets/home/home_search_bar.dart';
import '../widgets/home/home_food_section_view.dart';
import '../widgets/home/image_text_button.dart';
import '../widgets/home/animated_navigation_bar.dart';

enum FoodOptions { Analyse, Search, Scan }

const topImageHeight = 220;
const animatedControlOffsetY = topImageHeight - 44;

class FoodEncyclopedia extends StatefulWidget {
  static String tag = 'food_encyclopedia_page';

  @override
  _FoodEncyclopediaState createState() => _FoodEncyclopediaState();
}

class _FoodEncyclopediaState extends State<FoodEncyclopedia>
    with AutomaticKeepAliveClientMixin<FoodEncyclopedia> {
  @override
  bool get wantKeepAlive => true;

  List<dynamic> _foodGroup = [];
  ScrollController _scrollController = ScrollController();
  double opacity = 0;

  @override
  initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    _addScrollListener();
    _fetchHomeData();
  }

  _addScrollListener() {
    _scrollController.addListener(() {
      var offset = _scrollController.offset / animatedControlOffsetY;
      setState(() {
        opacity = offset < 0 ? 0 : (offset > 1 ? 1 : offset);
      });
    });
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

  _handleClickOptions(FoodOptions options) {
    switch (options) {
      case FoodOptions.Analyse:
        break;
      case FoodOptions.Search:
        break;
      case FoodOptions.Scan:
        break;
    }
    print(options);
  }

  _handleClickCategoryItem(var category) {
    print(category.toString());
  }

  _buildOptionSection() {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      height: 60,
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            offset: Offset(1, -1),
            blurRadius: 2)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ImageTextButton(
            title: '饮食分析',
            icon: Image.asset('assets/ic_home_analyse.png',
                width: 28, height: 28),
            onPress: () => _handleClickOptions(FoodOptions.Analyse),
          ),
          ImageTextButton(
            title: '搜索对比',
            icon: Image.asset('assets/ic_search_compare.png',
                width: 28, height: 28),
            onPress: () => _handleClickOptions(FoodOptions.Search),
          ),
          ImageTextButton(
            title: '扫码对比',
            icon: Image.asset('assets/ic_scan_compare.png',
                width: 28, height: 28),
            onPress: () => _handleClickOptions(FoodOptions.Scan),
          )
        ],
      ),
    );
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
    final imgHeight = topImageHeight + iphoneXNavHeight;

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

    final optionSection = _buildOptionSection();

    final foodSection = _buildFoodSection();
    final contentWrp = Container(
      margin: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[foodSection],
      ),
    );

    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[topImage, optionSection, contentWrp],
            ),
            controller: _scrollController,
          ),
        ),
        AnimatedNavigationBar(
          opacity: opacity,
          onPress: _handleClickSearchBar,
          onScan: _handleClickScanBtn,
        )
      ],
    );
  }
}
