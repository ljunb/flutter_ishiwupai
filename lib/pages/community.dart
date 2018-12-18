import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  static String tag = 'community_page';

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community>
    with
        AutomaticKeepAliveClientMixin<Community>,
        SingleTickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '逛吃',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 20,
                  fontWeight: FontWeight.w300),
            ),
            backgroundColor: Colors.white,
            bottom: TabBar(
              tabs: myTabs,
              labelColor: Colors.red,
              indicatorColor: Colors.red,
              unselectedLabelColor: Color(0xFF666666),
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
            elevation: 0,
          ),
          body: TabBarView(
            children: myTabs.map((Tab tab) {
              return Center(
                  child: Text(tab.text,
                      style: TextStyle(color: Color(0xFF666666))));
            }).toList(),
          ),
        ));
  }
}
