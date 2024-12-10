import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/home_screen.dart';
import 'package:newsapp/news/news_details.dart';
import 'package:newsapp/setting/setting.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingProvider(), child: NewsApp()));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routename: (context) => const HomeScreen(),
        NewsDetails.routename: (context) => NewsDetails(),
      },
      initialRoute: HomeScreen.routename,
      theme: AppTheme.lightMode,
      themeMode: ThemeMode.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingProvider.languagecode),
    );
  }
}
