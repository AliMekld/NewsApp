import 'package:flutter/material.dart';
import 'package:newsapp/widgets/NewsScrolableListBuilder.dart';
import '../widgets/myAppBar.dart';

// ignore: camel_case_types
class categoryDetails extends StatelessWidget {
  final String nameOfRequest;

  const categoryDetails({
    required this.nameOfRequest,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        myAppbar(nameOfRequest: nameOfRequest),
        NewsScrollableListBuilder(
          category: nameOfRequest,
        )
      ],
    ));
  }
}
