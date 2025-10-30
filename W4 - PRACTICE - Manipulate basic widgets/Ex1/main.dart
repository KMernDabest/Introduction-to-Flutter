import 'package:flutter/material.dart';

void main(){
  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 6, 120, 250),
        body: Center(
          child: Text(
            'Rafat plz stop play Novaria',
            style: TextStyle(
              fontSize: 50,
              color: Color.fromARGB(255, 226, 31, 31),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}