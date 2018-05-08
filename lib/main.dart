import 'package:flutter/material.dart';
import 'package:ui_experiments/rounded_image.dart';
import 'bottom_app_bar.dart';
import 'google_tasks_bottom_bar.dart';
import 'sliver.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const Curve scrollCurve = Curves.fastOutSlowIn;
  final PageController controller = new PageController();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'UI Experiments',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/bottom_app_bar': (context) => new BottomAppBarPage(),
        '/bottom_app_bar_google': (context) => new GoogleTasksBottomAppBarPage(),
      },
      home: new Scaffold(
        body: new PageView(
          controller: controller,
          onPageChanged: (index) => setState(() => _selectedIndex = index),
          children: <Widget>[
            new MyHomePage(title: 'Home'),
            new RoundedImageScreen(),
            new SliverSamplePage(),
            new BottomBarHomePage(),
          ],
        ),
        bottomNavigationBar: new BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
              controller.animateToPage(
                _selectedIndex,
                duration: kTabScrollDuration,
                curve: scrollCurve,
              );
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.image),
              title: new Text('Image'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.content_cut),
              title: new Text('Sliver'),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.border_horizontal),
              title: new Text('App Bar'),
            ),
          ],
        ),
      ),
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
            new DatePicker(),
            new TimePicker(),
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
