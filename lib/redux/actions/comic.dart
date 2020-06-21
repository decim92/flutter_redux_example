import 'dart:convert';
import 'package:redux_example/api/comic.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/model_extensions/comic.dart';
import 'package:redux_example/redux/actions/app_state.dart';
import 'package:redux_example/redux/states/app_state.dart';
import 'package:redux_example/redux/states/comic_state.dart';

class GetComicsAction extends BaseAction {
  GetComicsAction();

  @override
  Future<AppState> reduce() async {
    final response = await ComicApi.fetchComics();
    if (response.statusCode == 200) {
      List<Comic> comics =
          ComicAdditions.comicsFromJson(json.decode(response.body));
      ComicState comicState =
          state.comicState.copy(comics: comics, issueDetail: null);
      comicState.comics = comics;
      return state.copy(comicState: comicState);
    } else {
      return null;
    }
  }
}
