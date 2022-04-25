import 'package:app_mmobx_login/screens/login_screen.dart';
import 'package:flutter/material.dart';

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
      theme: ThemeData(
        primaryColor: Colors.deepOrangeAccent,
        textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.orange),
        scaffoldBackgroundColor: Colors.deepOrangeAccent
      ),
      home: LoginScreen(),
    );
  }
}
