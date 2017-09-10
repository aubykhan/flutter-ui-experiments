import 'package:flutter/material.dart';
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
            new MaterialButton(
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
