// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Models/categoryModel.dart';
import 'categoryConatainer.dart';

class CategoriesHorizintalscrollableList extends StatelessWidget {
  const CategoriesHorizintalscrollableList({
    super.key,
    required this.categories,
  });
  final List<CategoryModel> categories;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height * 0.13,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => CategoryContainer(
                model: categories[index],
              )),
    );
  }
}
