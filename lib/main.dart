import 'package:flutter/material.dart';
import 'package:statemanagement/screens/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF064479)),
        primaryColor: const Color(0xFF064479),
      ),
      home: const Home(),
    );
  }
}
