import 'package:flutter/material.dart';
import 'package:newsapp/views/Home.dart';

void main(List<String> args) {
  runApp(const Start());
}

class Start extends StatelessWidget {
  const Start({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
