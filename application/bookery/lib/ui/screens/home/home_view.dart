import 'package:bookery/library.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeViewModel>(
      converter: (store) => HomeViewModel.fromStore(store),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: Container()
          )
        );
      }
    );
  }
}