import 'package:meta/meta.dart';

import 'package:bookery/models/user.dart';
import 'package:bookery/models/navigation.dart';

@immutable
class AppState {

  final User user;
  final Navigation navigation;

  AppState({
    this.user,
    this.navigation
  });

  factory AppState.initial() => AppState(
    user: User.initial(),
    navigation: Navigation.initial()
  );

  AppState copyWith({
    User user,
    Navigation navigation
  }) => AppState(
    user: user ?? this.user,
    navigation: navigation ?? this.navigation
  );

}