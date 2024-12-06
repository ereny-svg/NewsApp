import 'package:flutter/material.dart';
import 'package:newsapp/api/api_service.dart';
import 'package:newsapp/models/sourcesresponse/source.dart';
import 'package:newsapp/tabs/sources_tabs.dart';
import 'package:newsapp/widgets/error_indicator.dart';
import 'package:newsapp/widgets/loading_indicator.dart';

class CategoryDetails extends StatelessWidget {
  String categoryId = '';
  CategoryDetails({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getSourse(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingIndicator();
        } else if (snapshot.hasError || snapshot.data?.status != 'ok') {
          return ErrorIndicator();
        } else {
          final Sources = snapshot.data?.sources ?? [];
         return SourcesTabs(sources: Sources);
        }
      },
    );
  }
}
