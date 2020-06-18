import 'package:redux_example/states/app_state.dart';
import 'package:redux_example/redux/actions.dart';

AppState reducer(AppState prevState, dynamic action) {
  return AppState(styleState: styleReducer(prevState.styleState, action));
}

StyleState styleReducer(StyleState prevState, dynamic action) {
  StyleState newState = StyleState.fromStyleState(prevState);

  if (action is FontSize) {
    newState.sliderFontSize = action.payload;
  } else if (action is Bold) {
    newState.bold = action.payload;
  } else if (action is Italic) {
    newState.italic = action.payload;
  }
  return newState;
}
