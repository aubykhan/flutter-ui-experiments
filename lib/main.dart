import 'package:flutter/material.dart';
import 'package:ui_experiments/extended_text_field.dart';
import 'package:ui_experiments/rounded_image.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter UI',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'UI Experiments'),
      routes: {
        '/rounded_image': (BuildContext context) => new RoundedImageScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new ExtendedTextField(
              hintText: 'Center aligned hint text :D',
              textAlign: TextAlign.center,
            ),
            new DatePicker(),
            new TimePicker(),
            new MaterialButton(
              color: Theme.of(context).accentColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/rounded_image');
              },
              child: const Text('Rounded image'),
            ),
          ],
        ),
      ),
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => new _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _date;

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: new Text(
        _date == null ? 'PICK DATE' : _date.toString(),
      ),
      textColor: Theme.of(context).accentColor,
      onPressed: () async {
        var date = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime.now().add(new Duration(days: -20)),
          lastDate: new DateTime.now().add(new Duration(days: 300)),
        );

        setState(() => _date = date);
      },
    );
  }
}

class TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => new _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  TimeOfDay _time;

  @override
  Widget build(BuildContext context) {
    return new FlatButton(
      child: new Text(
        _time == null ? 'PICK TIME' : _time.format(context),
      ),
      textColor: Theme.of(context).accentColor,
      onPressed: () async {
        var time = await showTimePicker(
          context: context,
          initialTime: new TimeOfDay.now(),
        );

        setState(() => _time = time);
      },
    );
  }
}
