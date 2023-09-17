import 'package:flutter/material.dart';
import 'package:newsapp/Models/newsModel.dart';
import 'NewsContainer.dart';

class NewsScrollableList extends StatelessWidget {
  //live list of converted map<dynamic> articals
  final List<NewsModel> articals;

  const NewsScrollableList({super.key, required this.articals});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: articals.length,
          (context, index) {
        return NewsContainer(
          newsModel: articals[index],
        );
      }),
    );
  }
}
