import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ishiwupai/widgets/common/placeholder_cell.dart';

class LargeListView extends StatefulWidget {
  LargeListView(
      {Key key,
      @required this.itemCount,
      @required this.itemBuilder,
      @required this.onFetch,
      this.onRetry,
      this.isLoadAll,
      this.placeholderBuilder})
      : super(key: key);

  final int itemCount;
  final Function itemBuilder;
  final Function onFetch;
  final Function onRetry;
  final bool isLoadAll;
  final Function placeholderBuilder;

  @override
  LargeListViewState createState() => LargeListViewState();
}

class LargeListViewState extends State<LargeListView> {
  ScrollController _scrollController = ScrollController();
  int _pageIndex = 1;
  bool _isLoadError = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  setError() => setState(() => _isLoadError = true);

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      final canLoadMore = _scrollController.offset ==
              _scrollController.position.maxScrollExtent &&
          !widget.isLoadAll;
      if (!canLoadMore) return;

      if (_isLoadError) {
        setState(() {
          _isLoadError = false;
        });
        widget.onFetch(_pageIndex);
      } else {
        _pageIndex++;
        widget.onFetch(_pageIndex);
      }
    });
  }

  Future _handleRefresh() async {
    if (widget.onFetch != null) {
      _pageIndex = 1;
      await widget.onFetch(_pageIndex);
    }
  }

  _handleRetry() {
    setState(() {
      _isLoadError = false;
    });
    _pageIndex = 1;
    widget.onRetry();
  }

  Widget _placeholderBuilder() {
    List<Widget> placeholderList = [];
    for (int i = 0; i < 10; i++) {
      var placeholder = PlaceholderCell();
      if (widget.placeholderBuilder != null) {
        placeholder = widget.placeholderBuilder();
      }
      placeholderList.add(placeholder);
    }
    return Column(children: placeholderList);
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < widget.itemCount) {
      return widget.itemBuilder(context, index);
    }
    // 首屏渲染
    if (widget.itemCount == 0) {
      return _placeholderBuilder();
    }

    final isLoading = !widget.isLoadAll && !_isLoadError;
    if (isLoading) {
      return Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CupertinoActivityIndicator(radius: 8),
            SizedBox(width: 5),
            Text('正在加载更多数据……',
                style: TextStyle(color: Colors.grey, fontSize: 14))
          ],
        ),
      );
    }

    final content = widget.isLoadAll ? '已加载完所有数据' : '网络出错';
    return Container(
      height: 44,
      child: Text(content),
    );
  }

  _buildErrorView() {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: GestureDetector(
        onTap: _handleRetry,
        child: Text('点击重试'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadError && widget.itemCount == 0) return _buildErrorView();

    return RefreshIndicator(
      color: Colors.red,
      onRefresh: _handleRefresh,
      child: ListView.builder(
        itemBuilder: _itemBuilder,
        controller: _scrollController,
        itemCount: widget.itemCount + 1,
      ),
    );
  }
}
