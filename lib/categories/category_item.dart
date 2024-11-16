import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  CategoryItem({super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadiusDirectional.only(
              topStart: Radius.circular(24),
              topEnd: Radius.circular(24),
              bottomStart: Radius.circular(index.isEven ? 24 : 0),
              bottomEnd: Radius.circular(index.isOdd ? 24 : 0))),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Image.asset('assets/images/${category.imagesName}.png'),
        Text(
          category.name,
          style: Theme.of(context).textTheme.titleLarge,
        )
      ]),
    );
  }
}
