import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:redux_example/home.dart';
import 'package:async_redux/async_redux.dart';
import 'package:redux_example/states/app_state.dart';

Future<void> main() async {
  await DotEnv().load('.env');
  final _initialState = AppState.initial();
  final Store<AppState> _store = Store<AppState>(initialState: _initialState);
  runApp(MyApp(store: _store));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;

  MyApp({this.store});

  @override
  Widget build(BuildContext context) => StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => Home(),
        },
      ));
}
