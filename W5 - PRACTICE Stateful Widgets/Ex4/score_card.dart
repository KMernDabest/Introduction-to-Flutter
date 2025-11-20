import 'package:flutter/material.dart';

class ScoreCard extends StatefulWidget {
  final String title;
  const ScoreCard({super.key, required this.title});

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {

  int _score = 1;

  void _addScore(){
    setState(() {
      if(_score < 10){
        _score++;
      }
    });
  }

  void _removeScore(){
    setState(() {
      if(_score > 0){
        _score--;
      }
    });
  }

  Color _getProgressColor(){
    if(_score >= 8){return Colors.green;}
    if(_score >= 5){return const Color.fromARGB(255, 122, 242, 88);}
    return const Color.fromARGB(255, 154, 240, 148);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3)
          ),
        ],
      ),
      child: Column(
        children: [
          // title of subject
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _removeScore, 
                iconSize: 30,
                icon: const Icon(Icons.remove)
              ),
              const SizedBox(width: 20),

              Text(
                '$_score',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),

              IconButton(
                onPressed: _addScore, 
                iconSize: 30,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(height: 15),

          // Asked AI for recommendation on how to create a progress bar
          LayoutBuilder(
            builder: (context, constraints) {
              double maxWidth = constraints.maxWidth;
              double currentWidth = ( _score / 10 ) * maxWidth;

              return Stack(
                children: [
                  Container(
                    height: 25,
                    width: maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey[300]!, width: 2),
                    ),
                  ),
                  Container(
                    height: 25,
                    width: currentWidth,
                    decoration: BoxDecoration(
                      color: _getProgressColor(),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}