import 'package:flutter/material.dart';

void displaySnackBar(BuildContext context, String title) {
  final snackBar = SnackBar(
    content: Text(title),
  );

  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
