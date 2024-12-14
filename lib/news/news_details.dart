import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/news/new_item.dart';
import 'package:newsapp/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatefulWidget {
  static const String routename = '/details';

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final news = ModalRoute.of(context)?.settings.arguments as NewItem;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage('assets/images/pattern.png'))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            news.news.source?.name ?? '',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 29),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: news.news.urlToImage ??
                      'https://sesupport.edumall.jp/hc/article_attachments/900009570963/noImage.jpg',
                  height: height * 0.25,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, url) => const LoadingIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported_outlined),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      news.news.source?.name ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppTheme.gray),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      news.news.title ?? "",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppTheme.darkgray,
                          fontWeight: FontWeight.w500),
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        timeago.format(DateTime.parse(news.news.publishedAt!)),
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppTheme.lightgray, fontSize: 13),
                      ),
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                          width: double.infinity,
                          height: height * 0.370,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 11, vertical: 24),
                                  child: Text(news.news.description ?? "")),
                              const SizedBox(
                                height: 55,
                              ),
                              GestureDetector(
                                onTap: () {
                                  launchUrl(Uri.parse(news.news.url ?? ''));
                                  setState(() {});
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: width * 0.64),
                                  child: Text(
                                    'View Full Article',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: AppTheme.darkgray,
                                            fontWeight: FontWeight.w500),
                                  ),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
