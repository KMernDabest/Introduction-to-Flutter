import 'package:flutter/material.dart';
import 'image_gallery.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageGallery(),
    ));