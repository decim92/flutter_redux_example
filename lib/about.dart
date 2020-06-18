import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:redux_example/drawer_menu.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/states/app_state.dart';

class About extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
          margin: EdgeInsets.all(10.0),
          child: StoreConnector<AppState, StyleState>(
            converter: (store) => store.state.styleState,
            builder: (context, state) {
              return RichText(
                text: TextSpan(
                  text: text,
                  style: TextStyle(
                    fontSize: state.viewFontSize,
                    color: Colors.lightBlue,
                    fontWeight:
                        state.bold ? FontWeight.bold : FontWeight.normal,
                    fontStyle:
                        state.italic ? FontStyle.italic : FontStyle.normal,
                  ),
                ),
              );
            },
          )),
    );
  }
}
