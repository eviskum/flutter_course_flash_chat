import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_flash_chat/screens/welcome_screen.dart';
import 'package:flutter_course_flash_chat/screens/chat_screen.dart';
import 'package:flutter_course_flash_chat/screens/login_screen.dart';
import 'package:flutter_course_flash_chat/screens/registration_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        // primaryColor: Colors.black,
        textTheme: const TextTheme(
          // subtitle2: TextStyle(color: Colors.black54),
          subtitle1: TextStyle(color: Colors.black54),
          // overline: TextStyle(color: Colors.black54),
          // caption: TextStyle(color: Colors.black54),
          // button: TextStyle(color: Colors.black54),
          // headline1: TextStyle(color: Colors.black54),
          // headline2: TextStyle(color: Colors.black54),
          // headline3: TextStyle(color: Colors.black54),
          // headline4: TextStyle(color: Colors.black54),
          // headline5: TextStyle(color: Colors.black54),
          headline6: TextStyle(color: Colors.black54),
          bodyText1: TextStyle(color: Colors.black54),
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
