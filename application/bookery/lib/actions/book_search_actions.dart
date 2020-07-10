import 'package:bookery/models/book.dart';
import 'package:meta/meta.dart';

@immutable
class BookSearchByQueryFinishedAction {
  final List<Book> bookList;

  BookSearchByQueryFinishedAction({@required this.bookList});
}

@immutable
class BookSearchByQueryFailedAction {}