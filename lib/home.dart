import 'package:flutter/material.dart';
import 'package:redux_example/drawer_menu.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_example/model/app_state.dart';

const kAppTitle = 'States by Redux';

class Home extends StatelessWidget {
  String text = lorem(paragraphs: 3, words: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Colors.teal,
      ),
      drawer: DrawerMenu(),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StoreConnector<AppState, StyleState>(
          converter: (store) => store.state.styleState,
          builder: (context, state) {
            return RichText(
              text: TextSpan(
                text: text,
                style: TextStyle(
                  fontSize: state.viewFontSize,
                  color: Colors.black,
                  fontWeight: state.bold ? FontWeight.bold : FontWeight.normal,
                  fontStyle: state.italic ? FontStyle.italic : FontStyle.normal,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
