import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/redux/states/app_state.dart';

class ListComicsViewModel extends BaseModel<AppState> {
  ListComicsViewModel();

  List<Comic> comics;
  VoidCallback onGet;
  bool isLoading;

  ListComicsViewModel.build({
    @required this.comics,
    @required this.onGet,
    @required this.isLoading,
  }) : super(equals: [comics]);

  @override
  ListComicsViewModel fromStore() => ListComicsViewModel.build(
        comics: state.comicState.comics,
        onGet: () => dispatch(GetComicsAction()),
        isLoading: state.isLoading,
      );
}
