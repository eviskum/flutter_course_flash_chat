import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_flash_chat/constants.dart';
import 'package:flutter_course_flash_chat/screens/chat_screen.dart';
import 'package:flutter_course_flash_chat/widgets/rounded_button.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;

  String email = '';
  String password = '';

  bool shouldSpin = false;

  void _loginUser() async {
    setState(() {
      shouldSpin = true;
    });
    try {
      final UserCredential newUser = await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamed(ChatScreen.routeName);
    } catch (e) {
      print(e);
    }
    setState(() {
      shouldSpin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingOverlay(
        isLoading: shouldSpin,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 200.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              const SizedBox(height: 48.0),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              const SizedBox(height: 8.0),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(hintText: 'Enter your password'),
              ),
              const SizedBox(height: 24.0),
              shouldSpin
                  ? CircularProgressIndicator.adaptive()
                  : RoundedButton(
                      buttonColor: Colors.lightBlueAccent,
                      buttonTxt: 'Log In',
                      buttonFn: _loginUser,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
