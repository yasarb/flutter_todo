import 'package:flutter/material.dart';

import 'package:flutter_todo/src/widgets/widgets.dart';

class NewTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.05;
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: height,
          ),
          _NewTaskAppBar(),
          _NewTaskText(),
          _NewTaskBottomBar(),
        ],
      ),
    );
  }
}

class _NewTaskAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            icon: Icon(
              Icons.clear,
              color: Colors.black,
              semanticLabel: 'cancel',
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.green,
              semanticLabel: 'save',
              size: 32,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class _NewTaskText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        child: TextField(
          autofocus: true,
          maxLength: 64,
          maxLines: 8,
          style: TextStyle(
            fontSize: 24,
          ),
          decoration: InputDecoration.collapsed(
            hintText: 'What would you like to do?',
            hintStyle: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class _NewTaskBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        IconButton(
          icon: Icon(
            Icons.attachment,
            color: Colors.black,
            semanticLabel: 'attachment',
            size: 32,
          ),
          onPressed: () {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('Not implemented yet.'),
                action: SnackBarAction(label: "DONE", onPressed: () {}),
              ),
            );
          },
        ),
        IconButton(
          icon: Icon(
            Icons.alarm_add,
            color: Colors.black,
            semanticLabel: 'Add alarm',
            size: 32,
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return DateTimeDialog();
              },
            );
          },
        ),
      ],
    );
  }
}
