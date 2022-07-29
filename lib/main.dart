import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: mYellowColor,
        scaffoldBackgroundColor: mBlackColor,
        canvasColor: mBlackColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: mGreyColor)
            .copyWith(
              bodyText1: TextStyle(color: mGreyColor),
              bodyText2: TextStyle(color: mGreyColor),
            ),
      ),
      home: const MainScreen(),
    );
  }
}
