import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_profile/constants/colors.dart';
import 'package:web_profile/screens/main/cubit/select_menu_cubit.dart';
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
      home: BlocProvider(
        create: (context) => SelectMenuCubit(),
        child: MainScreen(),
      ),
    );
  }
}
