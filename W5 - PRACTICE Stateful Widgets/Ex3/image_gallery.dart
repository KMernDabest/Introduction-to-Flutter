import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird1.jpg",
  "assets/w4-s2/something.jpg",
  "assets/w4-s2/women.jpg",
  "assets/w4-s2/man.jpg",
];

class ImageGallery extends StatefulWidget {
  const ImageGallery({
    super.key,
  });

  @override
  State<ImageGallery> createState() => _ImageGalleryState();
}

class _ImageGalleryState extends State<ImageGallery> {
  int _currentIndex = 0;

  void _showNextImage(){
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length;
    });
  }

  void _showPreviousImage(){
    setState(() {
      if(_currentIndex == 0){
        _currentIndex = images.length - 1;
      }else{
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _showPreviousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _showNextImage,
            ),
          ),
        ],
      ),
      body: Image.asset(images[_currentIndex]),
    );
  }
}