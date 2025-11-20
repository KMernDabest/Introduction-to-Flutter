import 'package:flutter/material.dart';
import 'selectable_button.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SelectableButton(),
            const SizedBox(height: 20),
            SelectableButton(),
            const SizedBox(height: 20),
            SelectableButton(),
          ],
        ),
      ),
    ),
  ),
);
