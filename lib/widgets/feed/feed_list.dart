import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../common/large_list_view.dart';

class FeedList extends StatefulWidget {
  FeedList({Key key, @required this.categoryId, @required this.itemBuilder})
      : assert(categoryId != 0),
        assert(itemBuilder != null);

  final int categoryId;
  final Widget Function(List list, int index) itemBuilder;

  @override
  _FeedListState createState() => _FeedListState();
}

class _FeedListState extends State<FeedList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List _list = [];
  bool _isLoadAll = false;

  @override
  void initState() {
    super.initState();
    _fetchList();
  }

  Future _fetchList([int pageIndex]) async {
    try {
      final queryStr = 'page=$pageIndex&category=${widget.categoryId}&per=10';
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
      print("[Feed]获取数据结束");
    } catch (e) {
      print(e.toString());
    }
  }

  _handleRetry() {
    setState(() {
      _isLoadAll = false;
      _list = [];
    });
  }

  _itemBuilder(BuildContext context, int index) {
    return widget.itemBuilder(_list, index);
  }

  @override
  Widget build(BuildContext context) {
    return LargeListView(
      isLoadAll: _isLoadAll,
      itemCount: _list.length,
      itemBuilder: _itemBuilder,
      onFetch: _fetchList,
      onRetry: _handleRetry,
    );
  }
}
