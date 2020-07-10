import 'package:bookery/models/book.dart';
import 'package:meta/meta.dart';

@immutable
class BookSearchState {

  final List<Book> searchResult;

  BookSearchState({
    @required this.searchResult
  });

  BookSearchState copyWith({
    List<Book> searchResult
  }) => BookSearchState(
    searchResult: searchResult ?? this.searchResult
  );

  factory BookSearchState.initial() => BookSearchState(
    searchResult: []
  );

}