import 'package:flutter/material.dart';

class SingleImageCell extends StatelessWidget {
  SingleImageCell({Key key, @required this.item, this.onPress});

  final dynamic item;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return GestureDetector(
        onTap: () => onPress(item),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          padding: const EdgeInsets.all(15),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: screen.width * 0.55,
                      child: Text(
                        item['title'],
                        maxLines: 2,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(item['source'],
                            style: const TextStyle(
                                fontSize: 13,
                                color: Color.fromRGBO(150, 150, 150, 1))),
                        SizedBox(width: 5),
                        Image.asset('assets/ic_feed_watch.png',
                            width: 12, height: 12),
                        SizedBox(width: 3),
                        Text(item['tail'],
                            style: const TextStyle(
                                color: Color.fromRGBO(150, 150, 150, 1),
                                fontSize: 13))
                      ],
                    ),
                  ],
                ),
              ),
              FadeInImage.assetNetwork(
                placeholder: 'assets/img_news_default.png',
                image: item['images'][0],
                height: 80,
                width: (screen.width - 15 * 2 - 10 * 2) / 3,
                fit: BoxFit.cover,
              )
            ],
          ),
        ));
  }
}
