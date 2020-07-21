import 'package:bookery/library.dart';
import 'package:bookery/utils/util_library.dart';

void _printError({
  @required String message,
  dynamic error
}) {
  logger.e(
    message,
    error ?? null,
    StackTrace.current
  );
}

class NetworkingError implements Exception {
  String message;

  NetworkingError({@required this.message}) {
    _printError(
      message: "NETWORKING ERROR. \n\n {$message}",
      error: this
    );
  }
}

class AuthenticationError implements Exception {
  String message;

  AuthenticationError({@required this.message}) {
    _printError(
      message: "AUTHENTICATION ERROR. \n\n {$message}",
      error: this
    );
  }
}

enum MemoryErrorType {
  keyIsNull,
  valueIsNull,
  keyNotFound
}

class MemoryError implements Exception {
  String message;
  MemoryErrorType type;

  MemoryError({@required this.message, @required this.type}) {
    _printError(
      message: "MEMORY ERROR. TYPE: {$type} \n\n {$message}",
      error: this
    );
  }
}