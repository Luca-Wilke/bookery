import 'package:bookery/library.dart';

List<Middleware<AppState>> createNavigationMiddleware() {
  return [
    TypedMiddleware<AppState, NavigationPushAction>(_navigationPush),
    TypedMiddleware<AppState, NavigationPopAction>(_navigationPop),
    TypedMiddleware<AppState, NavigationReplaceAction>(_navigationReplace),
  ];
}

_navigationPush(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigationPushAction).route;
  if (store.state.routes.last != routeName) {
    NavigationService.navigatorKey.currentState.pushNamed(routeName);
  }

  next(action);
}

_navigationPop(Store<AppState> store, action, NextDispatcher next) {
  NavigationService.navigatorKey.currentState.pop();

  next(action);
}

_navigationReplace(Store<AppState> store, action, NextDispatcher next) {
  final routeName = (action as NavigationReplaceAction).route;
  if (store.state.routes.last != routeName) {
    NavigationService.navigatorKey.currentState.pushReplacementNamed(routeName);
  }

  next(action);
}