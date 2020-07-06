import 'package:meta/meta.dart';

import 'package:bookery/models/user_state.dart';
import 'package:bookery/models/navigation_state.dart';

@immutable
class AppState {

  final UserState userState;
  final NavigationState navigationState;

  AppState({
    this.userState,
    this.navigationState
  });

  factory AppState.initial() => AppState(
    userState: UserState.initial(),
    navigationState: NavigationState.initial()
  );

  AppState copyWith({
    UserState user,
    NavigationState navigation
  }) => AppState(
    userState: user ?? this.userState,
    navigationState: navigation ?? this.navigationState
  );

}