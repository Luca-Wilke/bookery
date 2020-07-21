import 'package:bookery/library.dart';
import 'package:bookery/utils/util_library.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:bookery/models/book.dart';

enum SearchBy {
  all,
  title,
  author,
  topic,
  isbn,
  publisher
}

enum SortBy {
  newest,
  mostRelevant
}

class BookService {

  static Future<List<Book>> fetchBooksByQuery(String query, {
    SearchBy searchBy = SearchBy.all,
    SortBy sortBy = SortBy.mostRelevant
  }) async {

    try {
      //build url we are fetching data from based on search query and search type (author, title, publisher, ...)
      String url = _fetchBooksByQueryUrlBuilder(
        query: query,
        searchBy: searchBy,
        sortBy: sortBy
      );

      //fetch data from given url and store it in response Object
      http.Response response = await http.get(url);

      if (response.statusCode == 200) { //success
        //convert http response to json and cast it to map
        final decoded = convert.jsonDecode(response.body) as Map;
        //book list to return
        List<Book> books = List<Book>();
        //loop through items from 0 to itemCount and convert each json object of item to a book
        for (var item in decoded["items"]) {
          books.add(_convertJsonMapToBook(item));
        }

        return books;

      } else { //failure
        throw new Exception("Failed to fetch books by search query {$query}. Status code inequal 200.");
      }

    } catch (e) {
      throw new NetworkingError(message: e.toString());
    }

  }

  static String _fetchBooksByQueryUrlBuilder({
    @required String query,
    @required SearchBy searchBy,
    @required SortBy sortBy
  }) {

    String url;
    String orderBy = sortBy == SortBy.mostRelevant ? "relevance" : "newest";

    switch (searchBy) {
      case SearchBy.all:
        url = "https://www.googleapis.com/books/v1/volumes?maxResults=40&orderBy=$orderBy&printType=BOOKS&q=$query";
        break;
      case SearchBy.author:
        url = "https://www.googleapis.com/books/v1/volumes?maxResults=40&orderBy=$orderBy&printType=BOOKS&q=inauthor:$query";
        break;
      case SearchBy.isbn:
        url = "https://www.googleapis.com/books/v1/volumes?maxResults=40&orderBy=$orderBy&printType=BOOKS&q=isbn:$query";
        break;
      case SearchBy.publisher:
        url = "https://www.googleapis.com/books/v1/volumes?maxResults=40&orderBy=$orderBy&printType=BOOKS&q=inpublisher:$query";
        break;
      case SearchBy.title:
        url = "https://www.googleapis.com/books/v1/volumes?maxResults=40&orderBy=$orderBy&printType=BOOKS&q=intitle:$query";
        break;
      case SearchBy.topic:
        url = "https://www.googleapis.com/books/v1/volumes?maxResults=40&orderBy=$orderBy&printType=BOOKS&q=subject:{$query}";
        break;
    }

    return url;
  }

  static Book _convertJsonMapToBook(Map<dynamic, dynamic> encodedItem) {

    String title = encodedItem["volumeInfo"]["title"].toString();
    List<String> authors = List<String>();
    String cover;
    int pages;
    String subtitle;
    String description;
    String publisher;
    String publishDate;

    //convert json authors object to List<String> and check whether the authors key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("authors")) {
      authors.add("unknown");
    } else {
      for (var author in encodedItem["volumeInfo"]["authors"]) {
        authors.add(author.toString());
      }
    }

    //convert json pagecount field to int and check whether the pagecount key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("pageCount")) {
      pages = null;
    } else {
      pages = encodedItem["volumeInfo"]["pageCount"] as int;
    }

    //try to fetch cover image
    if ((encodedItem["volumeInfo"] as Map).containsKey("imageLinks")) {
      if ((encodedItem["volumeInfo"]["imageLinks"] as Map).containsKey("thumbnail")) {
        cover = encodedItem["volumeInfo"]["imageLinks"]["thumbnail"].toString();
      }
    }

    //convert json subtitle field to string and check whether the subtitle key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("subtitle")) {
      subtitle = null;
    } else {
      subtitle = encodedItem["volumeInfo"]["subtitle"].toString();
    }

    //convert json description field to string and check whether the description key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("description")) {
      description = null;
    } else {
      description = encodedItem["volumeInfo"]["description"].toString();
    }

    //convert json publisher field to string and check whether the publisher key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("publisher")) {
      publisher = null;
    } else {
      publisher = encodedItem["volumeInfo"]["publisher"].toString();
    }

    //convert json publishDate field to string and check whether the publishDate key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("publishDate")) {
      publishDate = null;
    } else {
      publishDate = encodedItem["volumeInfo"]["publishDate"].toString();
    }

    return Book(
      title: title,
      authors: authors,
      coverUrl: cover ?? null,
      pages: pages ?? null,
      subtitle: subtitle ?? null,
      description: description ?? null,
      publisher: publisher ?? null,
      publishDate: publishDate ?? null
    );
  }

}