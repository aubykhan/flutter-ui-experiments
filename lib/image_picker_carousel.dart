import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerCarouselPage extends StatefulWidget {
  ImagePickerCarouselPage({Key key}) : super(key: key);

  @override
  _ImagePickerCarouselPageState createState() => _ImagePickerCarouselPageState();
}

class _ImagePickerCarouselPageState extends State<ImagePickerCarouselPage> {
  List<Uint8List> _images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Carousel'),
      ),
      body: SafeArea(
        child: DefaultTabController(
          length: _images.length + 1,
          child: Stack(
            children: <Widget>[
              TabBarView(
                children: <Widget>[
                  if (_images.length > 0) ..._buildTypeA(),
                  Center(
                    child: RaisedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('Add'),
                      onPressed: _pickImage,
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TabPageSelector(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTypeA() {
    return List.generate(
      _images.length,
      (index) => Center(
        child: Image.memory(_images[index]),
      ),
    );
  }

  void _pickImage() async {
    var file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 60,
      maxWidth: 800,
    );
    var bytes = await file.readAsBytes();
    setState(() => _images.add(Uint8List.fromList(bytes)));
  }
}