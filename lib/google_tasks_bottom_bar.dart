import 'package:flutter/material.dart';

class GoogleTasksBottomAppBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: const Text('Tasks - Bottom App Bar')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: new Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          BottomAppBar(
            hasNotch: true,
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                )
              ],
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: FloatingActionButton.extended(
              icon: const Icon(Icons.add),
              label: const Text('Add a task'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
