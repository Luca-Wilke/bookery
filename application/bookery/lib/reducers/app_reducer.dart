import 'package:bookery/app_state.dart';
import 'package:bookery/reducers/navigation_reducer.dart';
import 'package:bookery/reducers/user_reducer.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    userState: userReducer(state.userState, action),
    routes: navigationReducer(state.routes, action)
  );
}