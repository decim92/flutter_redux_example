import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:redux_example/model/comic/detail/issue_detail.dart';
import 'package:redux_example/redux/actions/comic.dart';
import 'package:redux_example/redux/states/app_state.dart';

class IssueDetailViewModel extends BaseModel<AppState> {
  final String url;
  IssueDetailViewModel({this.url});
  bool isLoading;

  IssueDetail detail;
  VoidCallback onGet;

  IssueDetailViewModel.build({
    this.url,
    @required this.detail,
    @required this.onGet,
    @required this.isLoading,
  }) : super(equals: [detail]);

  @override
  IssueDetailViewModel fromStore() => IssueDetailViewModel.build(
        detail: state.comicState.issueDetail,
        onGet: () => dispatch(GetIssueDetailAction(url: this.url)),
        isLoading: state.isLoading,
      );
}
