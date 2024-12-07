import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/home_screen.dart';
import 'package:newsapp/news/news_details.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routename: (context) => const HomeScreen(),
      NewsDetails.routename: (context) =>  NewsDetails(),
      },
      initialRoute: HomeScreen.routename,
      theme: AppTheme.lightMode,
    
      themeMode: ThemeMode.light,
    );
  }
}
