import 'package:flutter/material.dart';
import 'package:newsapp/news/new_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (_,index)=>const NewItem(),itemCount: 6,);
  }
}