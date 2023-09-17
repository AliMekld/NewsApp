// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextHeaderOne extends StatelessWidget {
  final String text;
  double? size = 18;
  Color? color = Colors.amber;
  TextHeaderOne({super.key, required this.text, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            color: color, fontSize: size, fontWeight: FontWeight.bold));
  }
}
