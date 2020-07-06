import 'package:bookery/actions/user_actions.dart';
import 'package:bookery/app_state.dart';
import 'package:bookery/models/user.dart';

AppState userChangeNameReducer(AppState state, UserChangeNameAction action) {
  return state.copyWith(
    user: User(
      name: action.name
    )
  );
}