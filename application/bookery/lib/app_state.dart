import 'package:bookery/app_routes.dart';
import 'package:meta/meta.dart';

import 'package:bookery/models/user_state.dart';

@immutable
class AppState {

  final UserState userState;
  final List<String> routes;

  AppState({
    this.userState,
    this.routes
  });

  factory AppState.initial() => AppState(
    userState: UserState.initial(),
    routes: const [AppRoutes.launch]
  );

  AppState copyWith({
    UserState user,
    List<String> routes
  }) => AppState(
    userState: user ?? this.userState,
    routes: routes ?? this.routes
  );

}