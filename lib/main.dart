import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:redux_example/screens/home.dart';
import 'package:async_redux/async_redux.dart';
import 'package:redux_example/redux/states/app_state.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

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
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', "US"),
          const Locale('es'),
        ],
        initialRoute: '/',
        routes: {
          '/': (context) => I18n(child: Home()),
        },
      ));
}
