
import 'package:newsapp/models/all_news_response/article.dart';

class AllNewsResponse {
	final String? status;
	final int? totalResults;
	final List<Article>? articles;

	const AllNewsResponse({this.status, this.totalResults, this.articles});

	factory AllNewsResponse.fromJson(Map<String, dynamic> json) {
		return AllNewsResponse(
			status: json['status'] as String?,
			totalResults: json['totalResults'] as int?,
			articles: (json['articles'] as List<dynamic>?)
						?.map((e) => Article.fromJson(e as Map<String, dynamic>))
						.toList(),
		);
	}



	Map<String, dynamic> toJson() => {
				'status': status,
				'totalResults': totalResults,
				'articles': articles?.map((e) => e.toJson()).toList(),
			};
}
