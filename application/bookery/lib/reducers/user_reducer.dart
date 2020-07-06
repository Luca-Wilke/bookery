import 'package:bookery/actions/user_actions.dart';
import 'package:bookery/models/user_state.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, UserChangeNameAction>(userChangeNameReducer)
]);

UserState userChangeNameReducer(UserState state, UserChangeNameAction action) {
  return state.copyWith(
    name: action.name
  );
}