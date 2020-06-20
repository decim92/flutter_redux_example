import 'package:flutter/material.dart';
import 'package:flutter_lorem/flutter_lorem.dart';
import 'package:async_redux/async_redux.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/states/app_state.dart';
import 'package:redux_example/view_models/comic.dart';

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
      body: Container(
        margin: EdgeInsets.all(10),
        child: StoreConnector<AppState, ListComicsViewModel>(
          model: ListComicsViewModel(),
          onInit: (store) {
            StoreProvider.dispatch<AppState>(context, GetComicsAction());
          },
          builder: (context, viewModel) {
            return Column(children: [
              FlatButton(
                onPressed: () {
                  viewModel.onGet();
                },
                child: Text(
                  "Get comics",
                ),
              ),
              RichText(
                text: TextSpan(
                  text: viewModel.comics.isNotEmpty
                      ? viewModel.comics.first.name
                      : 'Loading',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
            ]);
          },
        ),
      ),
    );
  }
}
