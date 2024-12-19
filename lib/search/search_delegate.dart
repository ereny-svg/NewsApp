import 'package:flutter/material.dart';
import 'package:newsapp/api/api_service.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/news/new_item.dart';
import 'package:newsapp/news/news_details.dart';
import 'package:newsapp/widgets/error_indicator.dart';
import 'package:newsapp/widgets/loading_indicator.dart';

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
    if (query.isEmpty) {
      return Center(child: Text('Search for news '));
    }
    return FutureBuilder(
      future: ApiService.getAllNews(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final news = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                    NewsDetails.routename,
                    arguments: NewItem(news[index])),
                child: NewItem(news[index])),
            itemCount: news.length,
          );
        }
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(child: Text('News'));
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