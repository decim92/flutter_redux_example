import 'package:flutter/material.dart';
import 'package:async_redux/async_redux.dart';
import 'package:redux_example/components/containers/comic_grid_view.dart';
import 'package:redux_example/components/containers/comic_list_view.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/redux/states/app_state.dart';
import 'package:redux_example/view_models/home.dart';
import 'home.i18n.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final EdgeInsets _defaultScreenMargins = EdgeInsets.all(0);

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
        title: Text('Hi'.i18n + ' ' + 'Goodbye'.i18n),
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
        margin: _defaultScreenMargins,
        child: StoreConnector<AppState, ListComicsViewModel>(
          model: ListComicsViewModel(),
          onInit: (store) {
            StoreProvider.dispatch<AppState>(context, GetComicsAction());
          },
          builder: (context, viewModel) {
            if (viewModel.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
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
