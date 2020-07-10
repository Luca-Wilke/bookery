import 'package:bookery/library.dart';

class ErrorView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final String routeName = ModalRoute.of(context).settings.arguments;

    logError(routeName);

    return Scaffold(
      backgroundColor: Colors.redAccent[700],
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  "An error occurred. The route name '$routeName' does not exist. Stack trace: ",
                  style: TextStyle(
                    color: Colors.yellowAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  )
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: 30.0),
                    child: Text(
                      StackTrace.current.toString()
                    )
                  ),
                )
              ],
            )
          )
        )
      )
    );
  }

  void logError(String routeName) {
    logger.e("Route name $routeName does not exist.");
  }

}