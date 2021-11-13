import 'package:flutter/material.dart';
import 'package:flutter_course_flash_chat/screens/welcome_screen.dart';
import 'package:flutter_course_flash_chat/screens/chat_screen.dart';
import 'package:flutter_course_flash_chat/screens/login_screen.dart';
import 'package:flutter_course_flash_chat/screens/registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        hintColor: Colors.black54,
        textTheme: const TextTheme(
          // headline6: TextStyle(color: Colors.black54),
          // bodyText1: TextStyle(color: Colors.black54),
          bodyText2: TextStyle(color: Colors.black54),
        ),
      ),
      routes: {
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
        ChatScreen.routeName: (context) => ChatScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegistrationScreen.routeName: (context) => RegistrationScreen(),
      },
      initialRoute: WelcomeScreen.routeName,
      // home: WelcomeScreen(),
    );
  }
}
