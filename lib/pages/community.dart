import 'package:flutter/material.dart';

class Community extends StatefulWidget {
  static String tag = 'community_page';

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community>
    with AutomaticKeepAliveClientMixin<Community> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('逛吃'),
    );
  }
}
