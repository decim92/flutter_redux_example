import 'package:flutter/material.dart';
import 'package:redux_example/components/cells/comic_list_cell.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/screens/issue_detail.dart';

class ComicListView extends StatelessWidget {
  final EdgeInsets _defaultPadding = EdgeInsets.all(8.0);

  final List<Comic> comics;

  ComicListView({this.comics});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: _defaultPadding,
        itemCount: comics.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        IssueDetalScreen(comic: comics[index])),
              );
            },
            child: ComicListCell(
              comic: comics[index],
            ),
          );
        });
  }
}
