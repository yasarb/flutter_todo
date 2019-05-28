import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_todo/src/provider/task_list_provider.dart';
import 'package:flutter_todo/src/screens/home_page.dart';
import 'package:flutter_todo/src/screens/new_task_page.dart';

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskListProvider>(
      builder: (_) => TaskListProvider(),
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          fontFamily: 'Nunito',
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: _WrapperHomePage(),
      ),
    );
  }
}

class _WrapperHomePage extends StatelessWidget {
  const _WrapperHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewTaskPage()),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
