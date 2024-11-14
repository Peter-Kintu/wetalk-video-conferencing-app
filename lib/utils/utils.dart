import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
ShowSnackBar(BuildContext context, String text) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
    ),
  );
}