import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewsHeaderText extends StatelessWidget {
  int? maxLines = 2;
  final double size;
  final String text;
  Color? color = Colors.blueGrey;
  NewsHeaderText(
      {super.key,
      required this.text,
      required this.size,
      this.color,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.ltr,
      style: TextStyle(color: color, fontSize: size),
    );
  }
}
