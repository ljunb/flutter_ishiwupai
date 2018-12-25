import 'package:flutter/material.dart';

class InputNavigationBar extends StatefulWidget {
  InputNavigationBar(
      {Key key,
      @required this.onChanged,
      @required this.onBack,
      @required this.onScan});

  final Function onBack;
  final void Function(String text) onChanged;
  final Function onScan;

  @override
  _InputNavigationBarState createState() => _InputNavigationBarState();
}

class _InputNavigationBarState extends State<InputNavigationBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final navBarHeight = statusBarHeight + 44;

    _handleChangeText(String text) {
      if (widget.onChanged != null) {
        widget.onChanged(text);
      }
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: statusBarHeight),
      width: 375,
      height: navBarHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: widget.onBack,
            child: Image.asset(
              'assets/ic_back_search.png',
              color: Colors.red,
              width: 44,
              height: 44,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width - 44 * 2,
            child: TextField(
              controller: _controller,
              maxLines: 1,
              decoration: InputDecoration(
                  hintText: '请输入食物名称',
                  filled: true,
                  fillColor: Color.fromRGBO(239, 239, 239, 1),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.fromLTRB(2, 2, 0, 2),
                    child: Image.asset(
                      'assets/ic_scan.png',
                      width: 20,
                      height: 20,
                    ),
                  ),
                  border: InputBorder.none),
              onChanged: _handleChangeText,
            ),
          ),
          GestureDetector(
            onTap: widget.onScan,
            child: Container(
              margin: const EdgeInsets.only(left: 12),
              child: Image.asset(
                'assets/ic_homepage_search.png',
                width: 20,
                height: 20,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
