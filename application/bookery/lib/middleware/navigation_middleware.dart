import 'package:bookery/config/keys.dart';
import 'package:redux/redux.dart';

import 'package:bookery/app_state.dart';
import 'package:bookery/actions/navigation_actions.dart';

class NavigationMiddleware extends MiddlewareClass<AppState>{
  @override
  void call(Store<AppState> store, dynamic action, NextDispatcher next) {
    if (action is NavigationPushAction) {
      Keys.navigatorKey.currentState.pushNamed(action.route);
    }
    next(action);
  }
}