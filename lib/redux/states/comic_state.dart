import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/model/comic/detail/issue_detail.dart';

class ComicState {
  List<Comic> comics;
  IssueDetail issueDetail;

  ComicState({
    this.comics,
    this.issueDetail,
  });

  ComicState copy({List<Comic> comics, IssueDetail issueDetail}) {
    return ComicState(
        comics: comics ?? this.comics,
        issueDetail: issueDetail ?? this.issueDetail);
  }

  factory ComicState.initial() => ComicState(
        comics: List<Comic>(),
        issueDetail: null,
      );

  // static List<Comic> selectComicsbyGenre(AppState state, String genre)
  //  => state.comicState.comics.where((comic) => (comic.genre == genre)).toList();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is ComicState &&
            runtimeType == other.runtimeType &&
            listEquals(comics, other.comics);
  }

  @override
  int get hashCode => const ListEquality().hash(comics);
  // int get hashCode => const ListEquality.hash(comics);
}
