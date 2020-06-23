import 'package:redux_example/redux/actions/app_state.dart';
import 'package:redux_example/redux/states/app_state.dart';

class LoadingAction extends BaseAction {
  final bool isLoading;

  LoadingAction(this.isLoading);

  @override
  AppState reduce() {
    return state.copy(isLoading: isLoading);
  }
}
