import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:newsapp/Models/categoryModel.dart';
import 'package:newsapp/widgets/NewsScrolableListBuilder.dart';
import '../widgets/categorList.dart';
import '../widgets/defualtTextOne.dart';

class Home extends StatelessWidget {
  const Home({super.key});
// future work for this app
// 1- add flutter offline package
// 2- make webView for web app and configure the platform
  List<CategoryModel> get categories => const [
        CategoryModel(
            name: 'entertaiment', imageUrl: 'assets/entertaiment.avif'),
        CategoryModel(name: 'business', imageUrl: 'assets/health.avif'),
        CategoryModel(name: 'general', imageUrl: 'assets/health.avif'),
        CategoryModel(name: 'health', imageUrl: 'assets/health.avif'),
        CategoryModel(name: 'science', imageUrl: 'assets/science.avif'),
        CategoryModel(name: 'sports', imageUrl: 'assets/science.avif'),
        CategoryModel(name: 'technology', imageUrl: 'assets/technology.jpeg'),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // custom scroll view only takes slivers childs not any widget
        // so the solution is to wrap the widget with SliverToBoxAdabter widget
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              stretch: true,
              backgroundColor: Colors.white,
              pinned: true,
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextHeaderOne(text: "News", color: Colors.blueGrey.shade600),
                  TextHeaderOne(
                      text: "Cloud", color: Colors.redAccent.shade700),
                ],
              ),
            ),
            //categories section
            SliverToBoxAdapter(
              child: CategoriesHorizintalscrollableList(categories: categories),
            ),
            //news Section
            const NewsScrollableListBuilder(
              category: "general",
            ),
          ],
        ));
  }
}
