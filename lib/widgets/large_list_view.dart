import 'package:flutter/material.dart';

class LargeListView extends StatefulWidget {
  LargeListView(
      {Key key,
      @required this.itemCount,
      @required this.itemBuilder,
      @required this.onLoadMore,
      this.onRefresh,
      this.onRetry,
      this.footerWidget,
      this.isLoadAll})
      : super(key: key);

  final int itemCount;
  final Function itemBuilder;
  final Function onRefresh;
  final Function onLoadMore;
  final Function onRetry;
  final Widget footerWidget;
  final bool isLoadAll;

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
          _scrollController.position.maxScrollExtent && !widget.isLoadAll;
      if (!canLoadMore) return;

      if (_isLoadError) {
        setState(() {
          _isLoadError = false;
        });
        widget.onLoadMore(_pageIndex);
      } else {
        _pageIndex++;
        widget.onLoadMore(_pageIndex);
      }
    });
  }

  Future _handleRefresh() async {
    if (widget.onRefresh != null) {
      _pageIndex = 1;
      await widget.onRefresh(_pageIndex);
    }
  }

  _handleRetry() {
    setState(() {
      _isLoadError = false;
    });
    _pageIndex = 1;
    widget.onRetry();
  }

  Widget _itemBuilder(BuildContext context, int index) {
    if (index < widget.itemCount) {
      return widget.itemBuilder(context, index);
    }
    // 首屏渲染
    if (widget.itemCount == 0) {
      return Container(alignment: Alignment.center, child: Text('加载中……'));
    }

    var content = widget.isLoadAll ? '已加载完所有数据' : '正在加载跟多数据……';
    if (_isLoadError) {
      content = '网络出错';
    }
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
      onRefresh: _handleRefresh,
      child: ListView.builder(
        itemBuilder: _itemBuilder,
        controller: _scrollController,
        itemCount: widget.itemCount + 1,
      ),
    );
  }
}
