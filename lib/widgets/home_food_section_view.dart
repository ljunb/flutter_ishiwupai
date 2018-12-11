import 'package:flutter/material.dart';

class HomeFoodSectionView extends StatelessWidget {
  HomeFoodSectionView({Key key, this.group, this.onClickCategory});

  final group;
  final Function onClickCategory;
  static const titleMap = {
    'group': '食物分类',
    'brand': '热门品牌',
    'restaurant': '连锁餐饮'
  };

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    List<Widget> categories = [];
    for (var category in group['categories']) {
      categories.add(GestureDetector(
          onTap: () => this.onClickCategory(category),
          child: Container(
              height: 65,
              width: (screen.width - 16 * 2) / 3,
              margin: const EdgeInsets.only(bottom: 25),
              child: Column(children: <Widget>[
                Image.network(category['image_url'], width: 40, height: 40),
                SizedBox(height: 5),
                Text(category['name'], style: TextStyle(fontSize: 12))
              ]))));
    }
    return Container(
      color: Colors.white,
      width: screen.width - 16 * 2,
      margin: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: <Widget>[
          Container(
              height: 40,
              alignment: Alignment.center,
              child: Text(titleMap[group['kind']],
                  style: TextStyle(fontSize: 18))),
          Wrap(children: categories)
        ],
      ),
    );
  }
}
