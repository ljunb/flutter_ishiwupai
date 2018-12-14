import 'package:flutter/material.dart';
import '../widgets/me/static_cell.dart';

class Me extends StatefulWidget {
  static String tag = 'me_page';

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin<Me> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Container(
      child: Column(
        children: <Widget>[
          Image.asset('assets/img_my_navbar.png'),
          Image.asset('assets/img_my_head.png'),
          StaticCell(
            iconSource: 'assets/ic_my_photos.png',
            title: '我的照片',
          ),
          StaticCell(
            iconSource: 'assets/ic_my_collect.png',
            title: '我的收藏',
          ),
          StaticCell(
              iconSource: 'assets/ic_my_upload.png',
              title: '上传食物数据'
          )
        ],
      ),
    );
  }
}
