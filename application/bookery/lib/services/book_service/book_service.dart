import 'package:bookery/library.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:bookery/models/book.dart';

class BookService {

  static int _statusCodeSuccess = 200;

  static Future<List<Book>> fetchBooksByQuery(String query) async {
    //the url we are fetching data from
    String url = "https://www.googleapis.com/books/v1/volumes?maxResults=25&orderBy=relevance&printType=BOOKS&q={$query}";

    //fetch data from given url and store it in response Object
    http.Response response = await http.get(url).catchError((error) => 
      throw new FetchBooksByQueryFailedException(
        message: "Failed to fetch books by search query. Failed to get http response from the google books api. \n Error: {$error}",
        url: url
      )
    );

    if (response.statusCode == _statusCodeSuccess) { //success
      //convert http response to json and cast it to map
      final decoded = convert.jsonDecode(response.body) as Map;
      //book list to return
      List<Book> books = List<Book>();
      //loop through items from 0 to itemCount and convert each json object of item to a book
      for (var item in decoded["items"]) {
        books.add(_convertJsonToBook(item));
      }

      return books;

    } else { //failure
      String errorMessage = "Failed to fetch books by search query {$query}.";
      throw new FetchBooksByQueryFailedException(
        message: errorMessage,
        url: url
      );
    }
  }

  static Book _convertJsonToBook(Map<dynamic, dynamic> encodedItem) {

    String title = encodedItem["volumeInfo"]["title"];
    List<String> authors = List<String>();
    String cover;

    //convert json authors object to List<String> and check whether the authors key exists
    if (!(encodedItem["volumeInfo"] as Map).containsKey("authors")) {
      authors.add("unknown");
    } else {
      for (var author in encodedItem["volumeInfo"]["authors"]) {
        authors.add(author.toString());
      }
    }

    //try to fetch cover image
    cover = (encodedItem["volumeInfo"]["imageLinks"] as Map).containsKey("thumbnail") ? encodedItem["volumeInfo"]["imageLinks"]["thumbnail"].toString() : null;

    return Book(
      title: title,
      authors: authors,
      cover: cover
    );
  }

  static Image getBookCover(String url) {
    return Image.network(
      url,
      errorBuilder: (context, exception, trace) => throw new FetchBookCoverFailedException(
        message: "Failed to fetch book cover from url {$url}.",
        exception: exception
      ),
    );
  }

}