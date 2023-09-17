import 'package:flutter/material.dart';

import 'defualtTextOne.dart';

// ignore: camel_case_types
class myAppbar extends StatelessWidget {
  const myAppbar({
    super.key,
    required this.nameOfRequest,
  });

  final String nameOfRequest;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      leading: Padding(
        padding: const EdgeInsets.all(12.0),
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 26,
              color: Colors.blueGrey.shade700,
            )),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: TextHeaderOne(
        text: nameOfRequest,
        color: Colors.blueGrey.shade700,
      ),
    );
  }
}
