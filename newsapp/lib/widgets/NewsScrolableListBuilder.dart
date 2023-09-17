import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Models/newsModel.dart';
import 'package:newsapp/widgets/defualtTextOne.dart';
import '../WepServices(Api)/NewsServises(Api).dart';
import 'NewsText.dart';
import 'newsList.dart';
import 'package:flutter_offline/flutter_offline.dart';

// ignore: must_be_immutable
class NewsScrollableListBuilder extends StatefulWidget {
  const NewsScrollableListBuilder({super.key, required this.category});
  final String category;

  @override
  State<NewsScrollableListBuilder> createState() =>
      _NewsScrollableListBuilderState();
}

class _NewsScrollableListBuilderState extends State<NewsScrollableListBuilder> {
  Future<List<NewsModel>>? future;
  @override
  void initState() {
    super.initState();
    future = NewsApi(Dio()).getArticals(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        //future ==request
        future: future,
        builder: (context, snpshot) {
          if (snpshot.hasData) {
            return NewsScrollableList(
              //has data
              articals: snpshot.data!,
            );
          } else if (snpshot.hasError) {
            //has error
            return SliverFillRemaining(
              child: Center(
                  child: NewsHeaderText(
                      text: "Sorry thire was an error ,try later", size: 16)),
            );
          } else {
            //loading
            return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()));
          }
        });
  }
}
