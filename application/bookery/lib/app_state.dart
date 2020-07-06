import 'package:meta/meta.dart';

import 'package:bookery/models/user_state.dart';

@immutable
class AppState {

  final UserState userState;

  AppState({
    this.userState,
  });

  factory AppState.initial() => AppState(
    userState: UserState.initial(),
  );

  AppState copyWith({
    UserState user,
  }) => AppState(
    userState: user ?? this.userState,
  );

}