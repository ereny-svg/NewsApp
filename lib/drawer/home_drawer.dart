import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';

class HomeDrawer extends StatelessWidget {
  HomeDrawer({required this.onItemSelected});
  void Function(DrawerItem) onItemSelected;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: AppTheme.primaryLight,
            width: double.infinity,
            height: height * 0.2,
            child: Text(
              'News App!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsetsDirectional.only(top: 12, start: 12),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        Icon(Icons.menu),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Categories',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        Icon(Icons.settings),
                        SizedBox(
                          width: 16,
                        ),
                        Text(
                          'Settings',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum DrawerItem { categories, settings }
