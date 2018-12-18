import 'package:flutter/material.dart';

class MultiImageCell extends StatelessWidget {
  MultiImageCell({Key key, @required this.item, this.onPress});

  final dynamic item;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    List<Widget> imageList = [];
    for (String img in item['images']) {
      imageList.add(Image.network(
        img,
        height: 80,
        width: (screen.width - 15 * 2 - 10 * 2) / 3,
      ));
    }

    return GestureDetector(
      onTap: () => onPress(item),
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(15),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              item['title'],
              maxLines: 1,
              style: const TextStyle(fontSize: 15),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: imageList,
            ),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(item['source'],
                    style: const TextStyle(
                        fontSize: 13, color: Color.fromRGBO(150, 150, 150, 1))),
                SizedBox(width: 20),
                Image.asset('assets/ic_feed_watch.png', width: 12, height: 12),
                SizedBox(width: 3),
                Text(item['tail'],
                    style: const TextStyle(
                        color: Color.fromRGBO(150, 150, 150, 1), fontSize: 13))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
