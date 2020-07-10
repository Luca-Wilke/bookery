import 'package:bookery/library.dart';
import 'package:meta/meta.dart';

class Book {

  final String title;
  final List<String> authors;
  final String cover;
  
  Book({
    @required this.title,
    @required this.authors,
    this.cover
  });

}