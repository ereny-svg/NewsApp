import 'package:flutter/material.dart';
import 'package:newsapp/api/api_service.dart';
import 'package:newsapp/news/new_item.dart';
import 'package:newsapp/news/news_details.dart';
import 'package:newsapp/widgets/error_indicator.dart';
import 'package:newsapp/widgets/loading_indicator.dart';

class NewsList extends StatelessWidget {
  NewsList({super.key, required this.sourceId});
  final String sourceId;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getNews(sourceId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final news = snapshot.data?.articles ?? [];
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(NewsDetails.routename,arguments: NewItem(news: news[index]) ),
                child: NewItem(news: news[index])),
            itemCount: news.length,
          );
        }
      },
    );
  }
}
