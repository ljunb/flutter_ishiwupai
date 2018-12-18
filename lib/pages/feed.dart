import 'package:flutter/material.dart';
import '../widgets/feed/feed_list.dart';
import '../widgets/feed/evaluation_cell.dart';
import '../widgets/feed/single_image_cell.dart';
import '../widgets/feed/multi_image_cell.dart';

class Feed extends StatefulWidget {
  static String tag = 'feed_page';

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed>
    with AutomaticKeepAliveClientMixin<Feed>, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  TabController _tabController;
  final List<Tab> myTabs = <Tab>[
    Tab(text: '首页'),
    Tab(text: '评测'),
    Tab(text: '知识'),
    Tab(text: '美食'),
  ];

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  Widget _buildEvaluationItem(List list, int index) {
    return EvaluationCell(
      item: list[index],
      onPress: (feed) => print(feed),
    );
  }

  Widget _buildFeedItem(List list, int index) {
    List images = list[index]['images'];
    if (images.length == 1) {
      return SingleImageCell(
        item: list[index],
        onPress: (feed) => print(feed),
      );
    }
    return MultiImageCell(
      item: list[index],
      onPress: (feed) => print(feed),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '逛吃',
              style: const TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            backgroundColor: Colors.white,
            brightness: Brightness.light,
            bottom: TabBar(
              tabs: myTabs,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              labelStyle: TextStyle(fontSize: 15),
              unselectedLabelColor: const Color(0xFF666666),
              unselectedLabelStyle: TextStyle(fontSize: 14),
              indicatorSize: TabBarIndicatorSize.label,
            ),
            actions: <Widget>[
              IconButton(
                icon: Image.asset(
                  'assets/ic_feed_camera.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () => print('camera'),
              )
            ],
            elevation: 0.5,
          ),
          body: TabBarView(
            children: <Widget>[
              FeedList(
                categoryId: 2,
                itemBuilder: _buildEvaluationItem,
              ),
              FeedList(
                categoryId: 2,
                itemBuilder: _buildEvaluationItem,
              ),
              FeedList(
                categoryId: 3,
                itemBuilder: _buildFeedItem,
              ),
              FeedList(
                categoryId: 4,
                itemBuilder: _buildFeedItem,
              )
            ],
          ),
        ));
  }
}
