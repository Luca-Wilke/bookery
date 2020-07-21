import 'package:bookery/library.dart';

class Book {

  final String title;
  final String subtitle;
  final List<String> authors;
  final String coverUrl;
  final int pages;
  final String description;
  final String publisher;
  final String publishDate;
  
  Book({
    @required this.title, //there is always a valid title string
    @required this.authors, //"unknown" item in list if there are no authors specified in google books api
    this.subtitle, //string or null
    this.coverUrl, //string or null
    this.pages, //int or null
    this.description, //string or null
    this.publisher, //string or null
    this.publishDate //string or null
  });

}