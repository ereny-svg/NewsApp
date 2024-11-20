import 'package:flutter/material.dart';
import 'package:newsapp/categories/categories_grid.dart';
import 'package:newsapp/categories/category_details.dart';
import 'package:newsapp/drawer/home_drawer.dart';
import 'package:newsapp/models/category_model.dart';
import 'package:newsapp/setting/setting_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DrawerItem selectedItem = DrawerItem.categories;
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
            title: Text(selectedCategory != null
                ? selectedCategory!.name
                : selectedItem == DrawerItem.categories
                    ? 'News App'
                    : 'Settings')),
        drawer: HomeDrawer(
          onItemSelected: onDrawerItemChange,
        ),
        body: selectedCategory != null
            ? CategoryDetails(categoryId: selectedCategory!.id)
            : selectedItem == DrawerItem.categories
                ? CategoriesGrid(
                    onCategorySelected: onCategorySelected,
                  )
                : const SettingTap(),
      ),
    );
  }

  onDrawerItemChange(DrawerItem name) {
    selectedItem = name;
    selectedCategory = null;
    setState(() {});
    Navigator.of(context).pop();
  }

  onCategorySelected(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }
}
