import 'dart:convert';

import 'package:async_redux/async_redux.dart';
import 'package:redux_example/models/comic.dart';
import 'package:redux_example/states/app_state.dart';
import 'package:redux_example/states/comic_state.dart';

abstract class BaseAction extends ReduxAction<AppState> {
  ComicState get comicState => state.comicState;
  List<Comic> get comics => comicState.comics;
}