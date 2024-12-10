import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.onItemSelected});
  final void Function(DrawerItem) onItemSelected;
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
              AppLocalizations.of(context)!.newsApp,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 24),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsetsDirectional.only(top: 12, start: 12),
              color: AppTheme.white,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.categories),
                    child: Row(
                      children: [
                        const Icon(Icons.menu),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          AppLocalizations.of(context)!.categories,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppTheme.black),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                    onTap: () => onItemSelected(DrawerItem.settings),
                    child: Row(
                      children: [
                        const Icon(Icons.settings),
                        const SizedBox(
                          width: 16,
                        ),
                        Text(
                          AppLocalizations.of(context)!.settings,
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
