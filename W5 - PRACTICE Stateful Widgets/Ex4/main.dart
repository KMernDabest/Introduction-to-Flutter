import 'package:flutter/material.dart';
import 'score_card.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          title: const Text('My Score'),
          backgroundColor: Colors.green[400],
        ),
        body: const Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              ScoreCard(title: 'My Score in Dart'),
              SizedBox(height: 20),
              ScoreCard(title: 'My Score in Flutter'),
              SizedBox(height: 20),
              ScoreCard(title: 'My Score in React'),
            ],
          ),
        ),
      ),
    )
  );
}