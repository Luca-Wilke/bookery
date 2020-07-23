import 'package:bookery/ui/ui_library.dart';

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
      debugShowCheckedModeBanner: false,

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

      //theme
      theme: ThemeData(
        //is the theme overall rather light and colorful or dark?
        brightness: Brightness.light,
        //how much space is there between ui components?
        visualDensity: VisualDensity.standard, //zero (no density vertically and horizontally)
        //primary color palette -> auto genereted from one given color
        primarySwatch: Colors.blue,
        //colorful / bright primary color blue
        primaryColorBrightness: Brightness.light,
        //application background color
        scaffoldBackgroundColor: Colors.blue[50],
        //button theme settings
        buttonColor: Colors.blue[50],
        buttonTheme: ButtonThemeData(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0)
          ),
          buttonColor: Colors.blue[50],
          splashColor: Colors.black12
        ),
        //font families / font theme
        textTheme: GoogleFonts.quicksandTextTheme(
          Theme.of(context).textTheme
        ),
        //input decoration
        inputDecorationTheme: InputDecorationTheme(
          isDense: false,
          isCollapsed: false,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          fillColor: Colors.blue[50],
          hintStyle: Theme.of(context).textTheme.caption
        ),
      )

    );
  }

}