import 'package:flutter/material.dart';
import 'package:wetalk/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({super.key,
  required this.text, required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ElevatedButton(
        onPressed: onPressed,
        // ignore: sort_child_properties_last
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 17
            ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          minimumSize: const Size(
            double.infinity,
            50,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            side: const BorderSide(color: buttonColor),
          ),
        ),
      ),
    );
  }
}
