import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/home_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {HomeScreen.routename: (context) => HomeScreen()},
      initialRoute: HomeScreen.routename,
      theme: AppTheme.lightMode,
    
      themeMode: ThemeMode.light,
    );
  }
}
