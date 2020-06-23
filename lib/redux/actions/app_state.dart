import 'package:async_redux/async_redux.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/model/comic/detail/issue_detail.dart';
import 'package:redux_example/redux/states/app_state.dart';
import 'package:redux_example/redux/states/comic_state.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  ComicState get comicState => state.comicState;
  List<Comic> get comics => comicState.comics;
  IssueDetail get issueDetail => comicState.issueDetail;
  bool get isLoading => state.isLoading;
}
