import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';

class TabItems extends StatelessWidget {
 final  String sourceName;
 final bool isSelected;
 const TabItems({super.key, required this.sourceName, required this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      alignment: Alignment.center,
      width: 95,
      height: 34,
      decoration: BoxDecoration(
          color:
              isSelected == true ? AppTheme.primaryLight : Colors.transparent,
          border: Border.all(width: 2, color: AppTheme.primaryLight),
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        sourceName,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: isSelected == true ? AppTheme.white : AppTheme.primaryLight),
      ),
    );
  }
}
