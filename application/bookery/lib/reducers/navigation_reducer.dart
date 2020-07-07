import 'package:redux/redux.dart';

import 'package:bookery/actions/navigation_actions.dart';

final navigationReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, NavigationPushAction>(_navigationPushReducer),
  TypedReducer<List<String>, NavigationPopAction>(_navigationPopReducer),
  TypedReducer<List<String>, NavigationReplaceAction>(_navigationReplaceReducer)
]);

//add new entry to routes list
List<String> _navigationPushReducer(List<String> state, NavigationPushAction action) {
  var result = List<String>.from(state);
  result.add(action.route);
  return result;
}

//remove last entry of routes list
List<String> _navigationPopReducer(List<String> state, NavigationPopAction action) {
  var result = List<String>.from(state);
  result.removeLast();
  return result;
}

//replace whole route list with one route entry 
List<String> _navigationReplaceReducer(List<String> sate, NavigationReplaceAction action) => [action.route];