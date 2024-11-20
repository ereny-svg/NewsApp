import 'package:flutter/material.dart';
import 'package:newsapp/models/category_model.dart';

class CategoryItem extends StatelessWidget {
 final CategoryModel category;
 final int index;
 const CategoryItem({super.key, required this.index, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: category.color,
          borderRadius: BorderRadiusDirectional.only(
              topStart: const Radius.circular(24),
              topEnd: const Radius.circular(24),
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
