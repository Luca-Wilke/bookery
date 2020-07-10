import 'package:bookery/actions/book_search_actions.dart';
import 'package:bookery/library.dart';
import 'package:bookery/models/book.dart';
import 'package:flutter/cupertino.dart';

ThunkAction<AppState> bookSearchByQuery({@required Completer completer, @required String query}) {
  return (Store<AppState> store) async {
    try {
      List<Book> bookList = await BookService.fetchBooksByQuery(query);
      completer.complete();
      store.dispatch(new BookSearchByQueryFinishedAction(bookList: bookList));
    } catch (e) {
      store.dispatch(new BookSearchByQueryFailedAction());
      completer.completeError(e);
    }
  };
}