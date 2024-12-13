import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_constants.dart';
import 'package:newsapp/models/all_news_response/all_news_response.dart';
import 'package:newsapp/models/news_response/news_response.dart';
import 'package:newsapp/models/sourcesresponse/sourcesresponse.dart';

class ApiService {
  static Future<Sourcesresponse> getSourse(String categoryId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.sourseEndpoint,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return Sourcesresponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String sourceId) async {
    final uri = Uri.https(ApiConstants.baseURL, ApiConstants.newsEndpoint,
        {'apiKey': ApiConstants.apiKey, 'sources': sourceId});
    final response = await http.get(uri);
    final json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<AllNewsResponse> getAllNews(String query) async {
    final uri = Uri.http(ApiConstants.baseURL, ApiConstants.allNewsEndpoint,
        {'apiKey': ApiConstants.apiKey, 'q': query});
    final response =await http.get(uri);
    final json=jsonDecode(response.body);
   return AllNewsResponse.fromJson(json);
  }
}
