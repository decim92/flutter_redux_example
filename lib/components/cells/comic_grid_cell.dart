import 'package:flutter/material.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/model_extensions/comic.dart';

class ComicGridCell extends StatelessWidget {
  final double _titleFontSize = 14.0;
  final double _dateFontSize = 12.0;
  final EdgeInsets _defaultPadding = EdgeInsets.all(8.0);
  final EdgeInsets _defaultVerticalPadding =
      EdgeInsets.symmetric(vertical: 8.0);
  final int _maximumLinesForNameText = 3;

  final Comic comic;

  ComicGridCell({this.comic});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: _defaultPadding,
      child: Column(
        children: <Widget>[
          Image.network(comic.image.originalUrl),
          Padding(
            padding: _defaultVerticalPadding,
            child: Column(
              children: <Widget>[
                Text(
                  comic.issuedName(),
                  maxLines: _maximumLinesForNameText,
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
        ],
      ),
    );
  }
}
