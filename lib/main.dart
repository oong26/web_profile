import 'package:flutter/material.dart';
import 'package:web_profile/constants/colors.dart';
import 'package:web_profile/screens/main/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Oong',
      home: const MainScreen(),
    );
  }
}
