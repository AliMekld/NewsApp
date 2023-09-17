import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/Models/newsModel.dart';
import 'package:newsapp/views/linkPage.dart';

import 'NewsText.dart';

class NewsContainer extends StatelessWidget {
  final NewsModel newsModel;

  const NewsContainer({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LinkPage(
                      link: newsModel.newsLink!,
                    )));
      },
      child: Container(
        color: newsModel.imgUrl == null
            ? Colors.blueGrey.shade700
            : Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.50,
        margin: const EdgeInsets.all(14),
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6)),
                    child: CachedNetworkImage(
                      progressIndicatorBuilder: (context, url, progress) {
                        return const Center(child: CircularProgressIndicator());
                      },
                      imageUrl: newsModel.imgUrl!,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fill,
                    ))),
            Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                          child: NewsHeaderText(
                              size: 17, text: newsModel.newsHeader)),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: NewsHeaderText(
                              color: Colors.grey,
                              size: 14,
                              text: newsModel.newsSecondHeader ?? " empty"),
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
