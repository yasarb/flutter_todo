import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _Title(),
                _Subtitle(),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Hello Yasar',
      style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _Subtitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'You have 9 tasks',
      style: TextStyle(
        color: Colors.black54,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
