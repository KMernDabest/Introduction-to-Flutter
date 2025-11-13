import 'package:flutter/material.dart';
import 'HobbyCard.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('My Hobbies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
            HobbyCard(
              hobbyTitle: "Travelling",
              hobbyIcon: Icons.travel_explore,
              cardColor: Colors.green,
            ),
            HobbyCard(
              hobbyTitle: "Travelling",
              hobbyIcon: Icons.directions_run,
              cardColor: Colors.green,
            ),
            HobbyCard(
              hobbyTitle: "Travelling",
              hobbyIcon: Icons.menu_book,
              cardColor: Colors.green,
            ),
          ],
        ),
      ),
    ),
  ));
}