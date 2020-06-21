import 'package:flutter/material.dart';
import 'package:redux_example/components/cells/comic_grid_cell.dart';
import 'package:redux_example/models/comic.dart';

class ComicGridView extends StatelessWidget {
  final int _gridColumCount = 3;
  final double _cellAspectRatio = 0.47;

  final List<Comic> comics;

  ComicGridView({this.comics});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: true,
      crossAxisCount: _gridColumCount,
      childAspectRatio: _cellAspectRatio,
      children: List.generate(comics.length, (index) {
        return ComicGridCell(
          comic: comics[index],
        );
      }),
    );
  }
}
