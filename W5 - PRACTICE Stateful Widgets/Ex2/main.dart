import 'package:flutter/material.dart';
import 'favorite_card.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Favorite cards'),
      ),
      body: Column(
        children: [
          FavoriteCard(isFavorite: true),
          FavoriteCard(isFavorite: false),
          FavoriteCard(isFavorite: true),
        ],
      ),
    ),
  )
);