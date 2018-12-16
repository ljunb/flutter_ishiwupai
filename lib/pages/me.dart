import 'package:flutter/material.dart';
import '../widgets/me/static_cell.dart';
import '../widgets/me/login_button.dart';
import '../widgets/me/avatar_button.dart';

class Me extends StatefulWidget {
  static String tag = 'me_page';

  @override
  _MeState createState() => _MeState();
}

class _MeState extends State<Me> with AutomaticKeepAliveClientMixin<Me> {
  @override
  bool get wantKeepAlive => true;

  _handleClickSetting() {
    print('setting');
  }

  _handleClickAvatar() {
    print('avatar');
  }

  _handleClickLogin() {
    print('login');
  }

  _handleClickStaticCell(StaticCellType type) {
    switch (type) {
      case StaticCellType.Photos:
        break;
      case StaticCellType.Favorites:
        break;
      case StaticCellType.Upload:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final screen = MediaQuery.of(context).size;
    final statusBarH = MediaQuery.of(context).padding.top;

    final navWrp = Container(
      height: 44 + statusBarH,
      padding: EdgeInsets.only(top: statusBarH),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: screen.width - 44 * 2,
            height: 44,
            margin: const EdgeInsets.only(left: 44, right: 12),
            child: Text(
              '我的',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          GestureDetector(
            onTap: _handleClickSetting,
            child: Image.asset(
              'assets/ic_my_setting.png',
              width: 20,
              height: 20,
            ),
          ),
        ],
      ),
    );

    final profileWrp = Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: statusBarH + 44 + 12),
      child: Column(
        children: <Widget>[
          AvatarButton(
              icon: Image.asset('assets/img_default_avatar.png',
                  height: 80, width: 80),
              onPress: _handleClickAvatar),
          SizedBox(height: 10),
          LoginButton(title: '点击登录', onPress: _handleClickLogin)
        ],
      ),
    );

    final headImage = Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Image.asset('assets/img_my_navbar.png'),
            Image.asset('assets/img_my_head.png')
          ],
        ),
        navWrp,
        profileWrp
      ],
    );

    return Container(
      child: Column(
        children: <Widget>[
          headImage,
          StaticCell(
            iconSource: 'assets/ic_my_photos.png',
            title: '我的照片',
            type: StaticCellType.Photos,
            onPress: _handleClickStaticCell,
          ),
          StaticCell(
            iconSource: 'assets/ic_my_collect.png',
            title: '我的收藏',
            type: StaticCellType.Favorites,
            onPress: _handleClickStaticCell,
          ),
          StaticCell(
            iconSource: 'assets/ic_my_upload.png',
            title: '上传食物数据',
            type: StaticCellType.Upload,
            onPress: _handleClickStaticCell,
          )
        ],
      ),
    );
  }
}
