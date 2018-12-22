import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
    final screen = MediaQuery.of(context).size;
    final itemWidth = (screen.width - 15 * 3) / 2;
    final item = _list[index];
    final String imageStr = item['card_image'];
    final String title = item['title'];
    final String description = item['description'];
    final int likeCount = item['like_ct'];

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

    List<Widget> profiles = [];
    if (title.trim().length > 0) {
      profiles.add(
        Text(
          title.trim(),
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 14),
        ),
      );
    }

    if (description.trim().length > 0) {
      profiles.add(Text(
        description.trim(),
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13, color: Colors.grey),
      ));
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
          color: Colors.white,
          width: (MediaQuery.of(context).size.width - 15 * 3) / 2,
          padding: const EdgeInsets.all(4),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: profiles),
        ),
        Divider(
          color: Color(0xFFE4E4E4),
          height: 0,
        ),
        Container(
            color: Colors.white,
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/img_default_avatar.png',
                        image: item['publisher_avatar'],
                        width: 24,
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: itemWidth * 0.4,
                      child: Text(item['publisher'],
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 11, color: Colors.grey)),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/ic_feed_like.png',
                        width: 12, height: 12),
                    SizedBox(width: 2),
                    Text(likeCount.toString(),
                        style: TextStyle(fontSize: 11, color: Colors.grey))
                  ],
                )
              ],
            ))
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
      child: _buildListContent()
    );
  }
}
