import 'package:flutter/material.dart';

SnackBar commonSnackBar(BuildContext context, Color color, String msg) {
  return SnackBar(
    content: Text(
      msg,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: color,
  );
}
