import 'package:flutter/material.dart';
import 'package:newsapp/models/source.dart';
import 'package:newsapp/tabs/sources_tabs.dart';

class CategoryDetails extends StatefulWidget {
  String categoryId = '';
  CategoryDetails({required this.categoryId});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List<Source> sources =
      List.generate(10, (index) => Source(id: '$index', name: 'source$index'));
  @override
  Widget build(BuildContext context) {
    return SourcesTabs(
      sources: sources,
    );
  }
}
