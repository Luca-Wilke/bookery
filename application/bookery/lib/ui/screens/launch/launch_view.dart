import 'package:bookery/library.dart';

class LaunchView extends StatelessWidget {

  @override
  Widget build(BuildContext context) 
  {
    return StoreConnector<AppState, LaunchViewModel>(
      converter: (store) => LaunchViewModel.fromStore(store),
      builder: (context, model) {
        return Scaffold(
          body: SafeArea(
            child: RaisedButton(onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(NavigationPushAction(route: AppRoutes.home));
            },
            child: Text(I18n.of(context).greet))
          )
        );
      }
    ); 
  }
  
}