import 'package:flutter/material.dart';
import 'package:redux_example/home.dart';
import 'package:redux_example/about.dart';
import 'package:redux_example/settings.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_example/model/app_state.dart';
import 'package:redux_example/redux/reducers.dart';

void main() {
  final _initialState = AppState(styleState: StyleState(sliderFontSize: 0.5));
  final Store<AppState> _store =
      Store<AppState>(reducer, initialState: _initialState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
          '/about': (context) => About(),
          '/settings': (context) => Settings(),
        },
      ),
    );
  }
}
