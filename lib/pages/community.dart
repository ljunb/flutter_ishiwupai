import 'package:flutter/material.dart';
import '../widgets/large_list_view.dart';

class Community extends StatefulWidget {
  static String tag = 'community_page';

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community>
    with AutomaticKeepAliveClientMixin<Community> {
  @override
  bool get wantKeepAlive => true;

  List dataList = [];
  bool isLoadAll = false;
  GlobalKey<LargeListViewState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _onRefresh();
  }

  Future _onRefresh([int pageIndex]) async {
    await Future.delayed(Duration(seconds: 2), () {
      print('refresh');
      setState(() {
        dataList = List.generate(20, (i) => '哈喽,我是新刷新的 $i');
        isLoadAll = false;
      });
      _globalKey.currentState.setError();
    });
  }

  Future _onLoadMore(page) async {
    await Future.delayed(Duration(seconds: 1), () {
      print('加载更多');
      setState(() {
        dataList.addAll(List.generate(5, (i) => '第$page次上拉来的数据'));
//        isLoadAll = true;
      });
      _globalKey.currentState.setError();
    });
  }

  Future _onRetry() async {
    setState(() {
      isLoadAll = false;
    });
    await _onRefresh();
  }

  _renderRow(BuildContext context, int index) {
    return Container(
      height: 44,
      child: Text(dataList[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return LargeListView(
      key: _globalKey,
      onRefresh: _onRefresh,
      onLoadMore: _onLoadMore,
      onRetry: _onRetry,
      itemBuilder: _renderRow,
      itemCount: dataList.length,
      isLoadAll: isLoadAll,
    );
  }
}
