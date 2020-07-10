import 'package:bookery/generated/i18n.dart';

import 'library.dart';

class App extends StatelessWidget {

  final Store<AppState> store;

  App({
    Key key,
    @required this.store,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final i18n = I18n.delegate;

    return StoreProvider<AppState>(
      store: this.store,
      child: MaterialApp(

        //meta preferences
        title: AppConfig.name,

        //routes
        navigatorKey: NavigationService.navigatorKey,
        onGenerateRoute: (RouteSettings settings) => NavigationService.getRoute(settings),

        //internalization (i18n)
        localizationsDelegates: [
          i18n,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: i18n.supportedLocales,
        localeResolutionCallback: i18n.resolution(
          fallback: new Locale("en", "GB")
        ),

      )
    );
  }

}