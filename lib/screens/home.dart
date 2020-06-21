import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:redux_example/components/containers/comic_grid_view.dart';
import 'package:redux_example/components/containers/comic_list_view.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/states/app_state.dart';
import 'package:redux_example/view_models/comic.dart';

const kAppTitle = 'ComicBook';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isGridViewStyle;

  @override
  void initState() {
    _isGridViewStyle = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kAppTitle),
        backgroundColor: Colors.purple,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setGridStyle(false);
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setGridStyle(true);
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(0),
        child: StoreConnector<AppState, ListComicsViewModel>(
          model: ListComicsViewModel(),
          onInit: (store) {
            StoreProvider.dispatch<AppState>(context, GetComicsAction());
          },
          builder: (context, viewModel) {
            return _isGridViewStyle
                ? ComicGridView(comics: viewModel.comics)
                : ComicListView(comics: viewModel.comics);
            ;
          },
        ),
      ),
    );
  }

  void setGridStyle(bool isGridStyle) {
    setState(() {
      _isGridViewStyle = isGridStyle;
    });
  }
}
