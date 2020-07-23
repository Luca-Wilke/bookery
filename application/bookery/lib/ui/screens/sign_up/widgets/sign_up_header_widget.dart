import 'package:bookery/library.dart';
import 'package:bookery/ui/screens/sign_up/sign_up_viewModel.dart';

class SignUpHeaderWidget extends StatefulWidget {

  final signUpNameInputWidget = SignUpNameInputWidget();

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

class SignUpNameInputWidget extends StatefulWidget {
  @override
  _SignUpNameInputWidgetState createState() => _SignUpNameInputWidgetState();
}

class _SignUpNameInputWidgetState extends State<SignUpNameInputWidget> {

  final TextEditingController _controller = new TextEditingController();

  @override initState() {
    super.initState();
  }

  @override dispose() {
    _controller.dispose();

    super.dispose();
  }

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
        controller: _controller,
        //input settings
        maxLines: 1,
        maxLength: 20,
        maxLengthEnforced: true,
        expands: false,
        //design
        style: Theme.of(context).textTheme.bodyText1,
        decoration: InputDecoration(
          hintText: I18n.of(context).nameInputHint,
          contentPadding: EdgeInsets.only(left: 15.0),
        ),
        onChanged: (input) {
          SignUpViewModel.userNameInput = input;
        },
        onSubmitted: (name) {
          String error = SignUpViewModel.getErrorMessageForNameInput(SignUpViewModel.userNameInput, context);
          if (error != "") {
            SignUpViewModel.showErrorSnackbar(
              error, //error message string
              context //build context
            );
          }
        },
      ),
    );
  }

}