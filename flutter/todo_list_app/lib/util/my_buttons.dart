import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final onPressed;
  final String text;
  const MyButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.yellow[700],
      child: Text(text),
    );
  }
}
