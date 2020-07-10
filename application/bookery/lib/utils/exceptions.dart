import 'package:bookery/library.dart';
import 'package:meta/meta.dart';

class FetchBooksByQueryFailedException implements Exception {
  
  String message;
  String url;

  FetchBooksByQueryFailedException({
    @required this.message,
    @required this.url
  }) {
    logger.e(this.runtimeType.toString() + "\n\n" + "message: {$message}" + "\n\n" + "url: {$url}");
  }

}

class FetchBookCoverFailedException implements Exception {

  String message;
  Object exception;

  FetchBookCoverFailedException({
    @required this.message,
    @required this.exception
  }) {
    logger.e(this.runtimeType.toString() + "\n\n" + "message: {$message}" + "\n\n" + "exception object: {$exception}");
  }

}