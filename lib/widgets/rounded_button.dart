import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonTxt;
  final Function() buttonFn;

  const RoundedButton({
    required Color this.buttonColor,
    required String this.buttonTxt,
    required Function() this.buttonFn,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        // color: Colors.blueAccent,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: buttonFn,
          // onPressed: () {
          //   Navigator.of(context).pushNamed(RegistrationScreen.routeName);
          // },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            // 'Register',
            buttonTxt,
          ),
        ),
      ),
    );
  }
}
