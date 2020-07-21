import 'library.dart';
import 'package:bookery/services/services_library.dart';

class App extends StatelessWidget {

  App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;

    return MaterialApp(
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
    );
  }

}