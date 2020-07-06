import 'package:redux/redux.dart';

import 'package:bookery/actions/navigation_actions.dart';
import 'package:bookery/models/backup_test_navigation_state.dart';

final navigationReducer = combineReducers<NavigationState>([
  TypedReducer<NavigationState, NavigationPushAction>(navigationPushReducer)
]);

NavigationState navigationPushReducer(NavigationState state, NavigationPushAction action) {
  return state.copyWith(
    routes: state.routes..add(action.route)
  );
}