import 'package:flutter/material.dart';

class DateTimeDialog extends StatefulWidget {
  @override
  _DateTimeDialogState createState() => _DateTimeDialogState();
}

class _DateTimeDialogState extends State<DateTimeDialog> {
  DateTime date;
  TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      elevation: 8.0,
      backgroundColor: Colors.white,
      child: Container(
        padding: EdgeInsets.all(18),
        height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Pick Date & Time'),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(helperText: ''),
                style: Theme.of(context).textTheme.body1,
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(DateTime.now().day - 1),
                    lastDate: DateTime(DateTime.now().year + 2),
                    builder: (BuildContext context, Widget child) {
                      return Theme(
                        data: ThemeData.dark(),
                        child: child,
                      );
                    },
                  ).then((value) {
                    date = value;
                  });
                },
              ),
            ),
            Expanded(
              child: TextField(
                decoration: const InputDecoration(helperText: ''),
                maxLines: 1,
                style: Theme.of(context).textTheme.body1,
                onTap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (BuildContext context, Widget child) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: child,
                      );
                    },
                  ).then((value) {
                    time = value;
                  });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
