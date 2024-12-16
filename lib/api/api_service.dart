import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_constants.dart';
import 'package:newsapp/models/news_response/news_response.dart';
import 'package:newsapp/models/sourcesresponse/sourcesresponse.dart';
class ApiService {

 static Future<Sourcesresponse> getSourse(String categoryId)async{
final uri= Uri.https(ApiConstants.baseURL,ApiConstants.sourseEndpoint,
  {
     'apiKey':ApiConstants.apiKey,
     'category':categoryId
  }
  );
    final response=await http.get(uri);
    final json= jsonDecode(response.body);
  return  Sourcesresponse.fromJson(json);
  }
   static Future<NewsResponse> getNews(String sourceId,int page,int pageSize )async{
final uri= Uri.https(ApiConstants.baseURL,ApiConstants.newsEndpoint,
  {
     'apiKey':ApiConstants.apiKey,
     'sources':sourceId,
     'page':page,
     'pageSize':pageSize
  }
  );
    final response=await http.get(uri);
    final json= jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
