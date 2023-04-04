import 'package:flutter/material.dart';
import 'package:statemanagement/screens/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color.fromARGB(255, 2, 19, 248)),
        primaryColor: const Color.fromARGB(255, 159, 175, 166),
      ),
      home: const Home(),
    );
  }
}
