import 'library.dart';

void main() {
  //create singleton global static store for redux architecture and pass it to the material app constructor
  final store = Store<AppState>(
    appReducer,
    initialState: AppState.initial(),
    middleware: 
      []
      //change route state and handle navigation 
      ..addAll(createNavigationMiddleware())
      //handle api and async calls
      ..addAll([thunkMiddleware])
      //prints actions (debug)
      ..addAll([new LoggingMiddleware.printer()])
  );

  runApp(App(store: store));
}