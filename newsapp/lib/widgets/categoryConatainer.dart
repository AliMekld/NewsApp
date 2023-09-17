// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:newsapp/Models/categoryModel.dart';
import 'package:newsapp/views/CategoryDetails.dart';
import 'defualtTextOne.dart';

// ignore: must_be_immutable
class CategoryContainer extends StatelessWidget {
  final CategoryModel model;

  const CategoryContainer({
    super.key,
    required this.model,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => categoryDetails(
                    nameOfRequest: model.name,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                model.imageUrl!,
              ),
              fit: BoxFit.cover),
          boxShadow: const [
            BoxShadow(
                offset: Offset(1, 1),
                color: Colors.blueGrey,
                spreadRadius: 0.5,
                blurRadius: 2)
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.only(left: 8, top: 8, bottom: 8),
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.height * 0.16,
        child: Center(
          child: TextHeaderOne(
            text: model.name,
            color: Colors.white,
            size: 26,
          ),
        ),
      ),
    );
  }
}
