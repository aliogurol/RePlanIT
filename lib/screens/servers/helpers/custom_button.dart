import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget buttonText;
  final VoidCallback onPressed;

  CustomElevatedButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFD9D9D9)),
        side: MaterialStateProperty.all<BorderSide>(BorderSide(width: 1, color: Colors.black)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
      ),
      child: buttonText,
    );
  }
}
