import 'package:flutter/material.dart';
import 'package:stay_fit/bmi_theme.dart';

import 'mainpage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BMI_Theme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calucutor',
      theme: theme,
      home: const MainPage(),
    );
  }
}