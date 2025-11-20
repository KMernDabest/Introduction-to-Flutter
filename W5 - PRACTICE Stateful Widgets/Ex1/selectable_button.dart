import 'package:flutter/material.dart';

class SelectableButton extends StatefulWidget {
  const SelectableButton({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 400,
        height: 100,
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              _isSelected = !_isSelected;
            });
          }, 
          style: ElevatedButton.styleFrom(
            backgroundColor: _isSelected ? Colors.blue[500] : Colors.blue[50],
            foregroundColor: _isSelected ? Colors.white : Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: Center(
            child: Text(
              _isSelected ? 'Selected' : 'Not Selected' ,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          )
        ),
      ),
    );
  }
}
