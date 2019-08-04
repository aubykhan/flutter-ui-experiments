import 'package:flutter/material.dart';

class RoundedImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String imageUrl =
        'https://cdn.business2community.com/wp-content/uploads/2014/04/profile-picture-300x300.jpg';
    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Rounded image'),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new FlatButton.icon(
              textColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.image),
              label: Text('OPEN IMAGE PICKER CAROUSEL'),
              onPressed: () => Navigator.pushNamed(context, '/image_picker_carousel'),
            ),
            new Image.network(
              imageUrl,
              width: 100.0,
              height: 100.0,
            ),
            const Text('Network image'),
            new Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: new CircleAvatar(
                radius: 50.0,
                backgroundImage: new NetworkImage(
                  imageUrl,
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
                      image: new NetworkImage(imageUrl),
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
