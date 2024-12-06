import 'package:flutter/material.dart';
import 'package:newsapp/models/sourcesresponse/source.dart';
import 'package:newsapp/news/news_list.dart';
import 'package:newsapp/tabs/tab_item.dart';

class SourcesTabs extends StatefulWidget {
 const SourcesTabs({super.key, required this.sources});
 final List<Source> sources;

  @override
  State<SourcesTabs> createState() => _SourcesTabsState();
}

class _SourcesTabsState extends State<SourcesTabs> {
  int selectedTapIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
          length: widget.sources.length,
          child: TabBar(
              onTap: (index) {
                selectedTapIndex = index;
                setState(() {});
              },
              dividerColor: Colors.transparent,
              indicatorColor: Colors.transparent,
              tabAlignment: TabAlignment.start,
              isScrollable: true,
              tabs: widget.sources
                  .map((Source) => TabItems(
                        sourceName: Source.name?? '',
                        isSelected:
                            selectedTapIndex == widget.sources.indexOf(Source)
                                ? true
                                : false,
                      ))
                  .toList()),
        ),
         Expanded(child: NewsList(sourceId:  widget.sources[selectedTapIndex].id!,))
      ],
    );
  }
}
