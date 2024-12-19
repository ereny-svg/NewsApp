import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/app_theme.dart';
import 'package:newsapp/models/news_response/News.dart';
import 'package:newsapp/widgets/loading_indicator.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewItem extends StatelessWidget {
  NewItem(this.news, {super.key});
  final news;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 26),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ??
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
          Text(
            news.source?.name ?? '',
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: AppTheme.gray),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            news.title ?? "",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppTheme.darkgray, fontWeight: FontWeight.w500),
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              timeago.format(DateTime.parse(news.publishedAt.toString())),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: AppTheme.lightgray, fontSize: 13),
            ),
          )
        ],
      ),
    );
  }
}
