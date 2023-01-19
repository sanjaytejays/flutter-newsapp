import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:news/models/article_model.dart';

class FetchApi {
  static Future<NewsArticle> fetchdata() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=311284f8d6c44d77b18f0bf2934b128f'));

    Map news_data = jsonDecode(response.body);

    List articles = news_data['articles'];

    var _random = new Random();
    var myArticle = articles[_random.nextInt(articles.length)];

    return NewsArticle.fromApiToNews(myArticle);
  }
}
