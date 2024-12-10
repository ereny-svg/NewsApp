import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';

class NewsSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text(
      'Search Article',
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('data'));
  }

  @override
  ThemeData appBarTheme(context) {
    return Theme.of(context).copyWith(
        textTheme: TextTheme(titleSmall: TextStyle(color: Colors.black)),
        primaryColor: AppTheme.primaryLight,
        inputDecorationTheme: const InputDecorationTheme(
            labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppTheme.black),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 6),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.white)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.white)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(color: Colors.white)),
            filled: true,
            fillColor: AppTheme.white,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppTheme.primaryLight)),
        scaffoldBackgroundColor: Colors.white);
  }
}
