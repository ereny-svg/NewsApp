import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/categories/category_item.dart';
import 'package:newsapp/models/category_model.dart';

class CategoriesGrid extends StatelessWidget {
 final void Function(CategoryModel)onCategorySelected;
const CategoriesGrid({super.key, required this.onCategorySelected});

  @override
  Widget build(BuildContext context) {
    final categories = List.generate(
        6,
        (index) => CategoryModel(
            id: '$index',
            name: 'Sports',
            imagesName: 'ball',
            color: AppTheme.red));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text('Pick your category of interest',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: AppTheme.navy,
                    )),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 6,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24),
              itemBuilder: (_, index) => GestureDetector(
                onTap: (){
                  onCategorySelected(categories[index]);
                },
                child: CategoryItem(
                  index: index,
                  category: categories[index],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
