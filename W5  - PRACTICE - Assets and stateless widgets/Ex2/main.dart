import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Custom Buttons'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomButton(text: 'Submit', icon: Icons.check),
            SizedBox(height: 10),
            CustomButton.secondary(
              text: 'Time',
              icon: Icons.access_time, 
              iconPosition: IconPosition.right,
            ),
            // SizedBox(height: 10),
            // CustomButton.disabled(
            //   text: 'Account', 
            //   icon: Icons.person,
            //   iconPosition: IconPosition.right,
            // ),
          ],
        ),
      )
    )
  ));
}

enum ButtonType {
  primary(Colors.blue),
  secondary(Colors.green),
  disabled(Colors.grey);

  final Color color;
  const ButtonType(this.color);
}

enum IconPosition {
  left,
  right
}

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary
  });

  const CustomButton.primary({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left
  }) : buttonType = ButtonType.primary;

  const CustomButton.secondary({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left
  }) : buttonType = ButtonType.secondary;

  const CustomButton.disabled({
    super.key,
    required this.text,
    required this.icon,
    this.iconPosition = IconPosition.left
  }) : buttonType = ButtonType.disabled;

  @override
  Widget build(BuildContext context) {
    final Color contentColor = buttonType == ButtonType.disabled ? Colors.black : Colors.white;

    List<Widget> contentWidgets = [
      Icon(icon, color: contentColor),
      const SizedBox(width: 10),
      Text(
        text,
        style: TextStyle(color: contentColor, fontSize: 18)
      ),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: contentWidgets
        )
      )
    );
  }
}