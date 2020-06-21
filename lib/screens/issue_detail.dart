import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_example/model/comic/comic.dart';
import 'package:redux_example/model/comic/detail/credit.dart';
import 'package:redux_example/model_extensions/comic.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/redux/states/app_state.dart';
import 'package:redux_example/view_models/issue_detail.dart';

class IssueDetalScreen extends StatelessWidget {
  final double _listHeaderHeight = 40.0;
  final double _listCellHeight = 55.0;

  final Comic comic;

  IssueDetalScreen({this.comic});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IssueDetailViewModel>(
      model: IssueDetailViewModel(url: this.comic.apiDetailUrl),
      onInit: (store) {
        StoreProvider.dispatch<AppState>(
            context, GetIssueDetailAction(url: this.comic.apiDetailUrl));
      },
      builder: (context, viewModel) {
        return Scaffold(
          appBar: AppBar(
              title: Text(this.comic.issuedName()),
              backgroundColor: Colors.purple,
              automaticallyImplyLeading: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )),
          body: Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Image.network(comic.image.screenLargeUrl),
                  Container(
                    height: creditListSizeFor(viewModel.detail != null
                        ? viewModel.detail.characterCredits.length
                        : 0),
                    child: CreditListView(
                        title: 'Characters',
                        credits: viewModel.detail != null
                            ? viewModel.detail.characterCredits
                            : []),
                  ),
                  Container(
                    height: creditListSizeFor(viewModel.detail != null
                        ? viewModel.detail.teamCredits.length
                        : 0),
                    child: CreditListView(
                        title: 'Team',
                        credits: viewModel.detail != null
                            ? viewModel.detail.teamCredits
                            : []),
                  ),
                  Container(
                    height: creditListSizeFor(viewModel.detail != null
                        ? viewModel.detail.locationCredits.length
                        : 0),
                    child: CreditListView(
                        title: 'Locations',
                        credits: viewModel.detail != null
                            ? viewModel.detail.locationCredits
                            : []),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  double creditListSizeFor(
    int count,
  ) {
    return _listHeaderHeight + _listCellHeight * count;
  }
}

class CreditListView extends StatelessWidget {
  final EdgeInsets _defaultPadding = EdgeInsets.all(8.0);
  final double _headerFontSize = 18.0;
  final String title;
  final List<Credit> credits;

  CreditListView({this.title, this.credits});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: _defaultPadding,
        itemCount: credits.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Text(
              title,
              style: TextStyle(
                  fontSize: _headerFontSize, fontWeight: FontWeight.bold),
            );
          }
          return ListTile(title: Text(credits[index - 1].name));
        });
  }
}
