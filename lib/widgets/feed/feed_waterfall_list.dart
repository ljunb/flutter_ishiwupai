import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedWaterfallList extends StatefulWidget {
  @override
  _FeedWaterfallListState createState() => _FeedWaterfallListState();
}

class _FeedWaterfallListState extends State<FeedWaterfallList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List _list = [];

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  Future _fetchList([int pageIndex = 1]) async {
    try {
      final queryStr = 'page=$pageIndex&category=1&per=10';
      final url = 'http://food.boohee.com/fb/v1/feeds/category_feed?$queryStr';
      http.Response response = await http.get(url);
      if (response.statusCode != 200) {
        print("[Feed-评测] 请求出错：" + response.statusCode.toString());
        return;
      }

      var map = json.decode(response.body);
      setState(() {
        if (pageIndex == 1) {
          _list = map['feeds'];
        } else {
          _list.addAll(map['feeds']);
        }
      });
      print("[Feed]获取数据结束" + _list.toString());
    } catch (e) {
      print(e.toString());
    }
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final item = _list[index];
    String imageStr = item['card_image'];

    if (item['content_type'] == 6) {
      return GestureDetector(
        child: FadeInImage.assetNetwork(
          placeholder: 'assets/img_news_default.png',
          width: (MediaQuery.of(context).size.width - 15 * 3) / 2,
          image: imageStr.split('?')[0],
          fit: BoxFit.cover,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FadeInImage.assetNetwork(
          placeholder: 'assets/img_news_default.png',
          width: (MediaQuery.of(context).size.width - 15 * 3) / 2,
          image: imageStr.split('?')[0],
          fit: BoxFit.cover,
        ),
        Container(
          alignment: Alignment.centerLeft,
          color: Colors.white,
          width: (MediaQuery.of(context).size.width - 15 * 3) / 2,
          padding: const EdgeInsets.all(4),
          child: Column(
            children: <Widget>[
              Text(
                item['title'],
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
              Text(
                item['description'],
                maxLines: 2,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              )
            ],
          ),
        ),
        Divider(color: Color(0xFFE4E4E4)),
        Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Image.network(item['publisher_avatar'], width: 30, height: 30,),
                ),
                SizedBox(width: 8),
                Text(item['publisher'])
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildListContent() {
    return StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(15),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        itemBuilder: _itemBuilder,
        itemCount: _list.length,
        staggeredTileBuilder: (int index) => StaggeredTile.fit(1));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _fetchList,
      child: _buildListContent(),
    );
  }
}
