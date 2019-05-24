import 'package:flutter/material.dart';
import 'package:flutter_todo/src/screens/home_page.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        fontFamily: 'Nunito',
        primarySwatch: Colors.pink,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0x778E9EAB),
                Color(0xFFEEF2F3),
              ],
            ),
          ),
          child: HomePage(),
        ),
      ),
    );
  }
}
