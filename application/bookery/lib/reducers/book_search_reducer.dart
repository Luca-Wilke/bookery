import 'package:bookery/actions/book_search_actions.dart';
import 'package:bookery/models/book_search_state.dart';
import 'package:redux/redux.dart';

final bookSearchReducer = combineReducers<BookSearchState>([
  TypedReducer<BookSearchState, BookSearchByQueryFinishedAction>(bookSearchByQueryFinishedReducer),
  TypedReducer<BookSearchState, BookSearchByQueryFailedAction>(bookSearchByQueryFailedReducer)
]);

BookSearchState bookSearchByQueryFinishedReducer(BookSearchState state, BookSearchByQueryFinishedAction action) {
  return state.copyWith(
    searchResult: action.bookList
  );
}

BookSearchState bookSearchByQueryFailedReducer(BookSearchState state, BookSearchByQueryFailedAction action) {
  return state.copyWith(
    searchResult: []
  );
}