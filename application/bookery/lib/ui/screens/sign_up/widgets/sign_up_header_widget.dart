import 'package:bookery/library.dart';

class SignUpHeaderWidget extends StatefulWidget {

  final signUpNameInputWidget = _SignUpNameInputWidget();

  @override
  _SignUpHeaderWidgetState createState() => _SignUpHeaderWidgetState();
}

class _SignUpHeaderWidgetState extends State<SignUpHeaderWidget> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(MediaQuery.of(context).size.height*0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildTitleWidget(context),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              widget.signUpNameInputWidget,
              Text(
                " !",
                style: Theme.of(context).textTheme.headline2
              )
            ],
          )
        ]
      ),
    );
  }

  Widget _buildTitleWidget(BuildContext context) {
    return Text(
      "Hallo,",
      style: Theme.of(context).textTheme.headline3
    );
  }
}

class _SignUpNameInputWidget extends StatefulWidget {
  @override
  __SignUpNameInputWidgetState createState() => __SignUpNameInputWidgetState();
}

class __SignUpNameInputWidgetState extends State<_SignUpNameInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildInputField(context)
      ],
    );
  }

  Widget _buildInputField(BuildContext context) {
    return SizedBox.fromSize(
      size: Size(
        MediaQuery.of(context).size.width * 0.65, 
        MediaQuery.of(context).size.height * 0.085
      ),
      child: TextField(
        //input settings
        maxLines: 1,
        maxLength: 20,
        maxLengthEnforced: true,
        expands: false,
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: I18n.of(context).nameInputHint,
          contentPadding: EdgeInsets.only(left: 5.0),
        ),
      ),
    );
  }

}