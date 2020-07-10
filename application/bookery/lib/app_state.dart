import 'package:bookery/app_routes.dart';
import 'package:bookery/models/book_search_state.dart';
import 'package:meta/meta.dart';

import 'package:bookery/models/user_state.dart';

@immutable
class AppState {

  final UserState userState;
  final List<String> routes;
  final BookSearchState bookSearchState;

  AppState({
    @required this.userState,
    @required this.routes,
    @required this.bookSearchState
  });

  factory AppState.initial() => AppState(
    userState: UserState.initial(),
    routes: [AppRoutes.launch],
    bookSearchState: BookSearchState.initial()
  );

  AppState copyWith({
    UserState user,
    List<String> routes,
    BookSearchState bookSearchState
  }) => AppState(
    userState: user ?? this.userState,
    routes: routes ?? this.routes,
    bookSearchState: bookSearchState ?? this.bookSearchState
  );

}