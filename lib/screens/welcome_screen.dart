import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_flash_chat/screens/login_screen.dart';
import 'package:flutter_course_flash_chat/screens/registration_screen.dart';
import 'package:flutter_course_flash_chat/widgets/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String routeName = '/welcome';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late final AnimationController controller;
  late final Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller);
    controller.forward();

    // animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.red.withOpacity(controller.value),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: animation.value * 60,
                    height: 60.0,
                  ),
                ),
                // Text(
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    textStyle: const TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                      // color: Colors.black,
                    ),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 48.0),
            RoundedButton(
              buttonColor: Colors.lightBlueAccent,
              buttonTxt: 'Log In',
              buttonFn: () {
                Navigator.of(context).pushNamed(LoginScreen.routeName);
              },
            ),
            RoundedButton(
              buttonColor: Colors.blueAccent,
              buttonTxt: 'Register',
              buttonFn: () {
                Navigator.of(context).pushNamed(RegistrationScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
