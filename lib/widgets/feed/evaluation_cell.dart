import 'package:flutter/material.dart';

class EvaluationCell extends StatelessWidget {
  EvaluationCell({Key key, @required this.item, this.onPress});

  final dynamic item;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => onPress(item),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 15),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/img_news_default.png',
              image: item['background'],
              height: screen.height * 0.3,
              width: screen.width - 16 * 2,
              fit: BoxFit.cover,
            )
          ),
          Container(
            height: screen.height * 0.3,
            width: screen.width - 16 * 2,
            padding: const EdgeInsets.fromLTRB(16, 15 + 20.0, 16, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(item['source'],
                    style: const TextStyle(color: Colors.white, fontSize: 13)),
                Text(item['title'],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset('assets/ic_feed_read.png',
                        width: 12, height: 12),
                    SizedBox(width: 3),
                    Text(item['tail'],
                        style:
                            const TextStyle(color: Colors.white, fontSize: 13))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
