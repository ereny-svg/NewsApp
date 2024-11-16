import 'package:flutter/material.dart';
import 'package:newsapp/categories/categories_grid.dart';
import 'package:newsapp/drawer/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routename = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(title: Text('News App')),
        drawer: HomeDrawer(),
        body: CategoriesGrid(),
      ),
    );
  }
}
