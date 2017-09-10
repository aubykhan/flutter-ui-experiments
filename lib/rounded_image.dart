import 'package:flutter/material.dart';

class RoundedImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Rounded image'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Image.network(
              'http://zblogged.com/wp-content/uploads/2015/11/17.jpg',
              width: 100.0,
              height: 100.0,
            ),
            const Text('Network image'),
            new Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: new CircleAvatar(
                radius: 50.0,
                backgroundImage: new NetworkImage(
                  'http://zblogged.com/wp-content/uploads/2015/11/17.jpg',
                ),
              ),
            ),
            const Text('Circle avatar image'),
            new Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: new Container(
                width: 100.0,
                height: 100.0,
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: new NetworkImage(
                          'http://zblogged.com/wp-content/uploads/2015/11/17.jpg'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(20.0))),
              ),
            ),
            const Text('Rounded borders image'),
          ],
        ),
      ),
    );
  }
}
