import 'package:flutter/material.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/model_extensions/comic.dart';

class ComicListCell extends StatelessWidget {
  final double _cellHeight = 160.0;
  final double _titleFontSize = 14.0;
  final double _dateFontSize = 12.0;
  final EdgeInsets _defaultPadding = EdgeInsets.all(8.0);

  final Comic comic;

  ComicListCell({this.comic});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _cellHeight,
      padding: _defaultPadding,
      child: Row(
        children: <Widget>[
          Image.network(comic.image.originalUrl),
          Expanded(
            child: Padding(
              padding: _defaultPadding,
              child: Column(
                children: <Widget>[
                  Text(
                    comic.issuedName(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: _titleFontSize),
                  ),
                  Text(
                    comic.readableDate(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: _dateFontSize),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
