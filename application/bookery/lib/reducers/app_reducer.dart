import 'package:bookery/reducers/user_reducer.dart';
import 'package:redux/redux.dart';
import 'package:bookery/app_state.dart';
import 'package:bookery/actions/user_actions.dart';
//reducer imports
//import 'user_reducer.dart';

final reducer = combineReducers<AppState>([
  TypedReducer<AppState, UserChangeNameAction>(userChangeNameReducer)
]);