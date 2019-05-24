import 'package:flutter/material.dart';

import 'package:flutter_todo/src/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.1;
    return Column(
      children: <Widget>[
        SizedBox(
          height: height,
        ),
        Header(),
        TaskList()
      ],
    );
  }
}
