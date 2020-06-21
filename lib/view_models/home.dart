import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/redux/states/app_state.dart';

class ListComicsViewModel extends BaseModel<AppState> {
  ListComicsViewModel();

  List<Comic> comics;
  VoidCallback onGet;

  ListComicsViewModel.build({
    @required this.comics,
    @required this.onGet,
  }) : super(equals: [comics]);

  @override
  ListComicsViewModel fromStore() => ListComicsViewModel.build(
        comics: state.comicState.comics,
        onGet: () => dispatch(GetComicsAction()),
      );
}
