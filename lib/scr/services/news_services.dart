import 'package:flutter/material.dart';
import 'package:news_app/scr/models/news_models.dart';
import 'package:http/http.dart' as http;

final _urlNEWS = 'https://newsapi.org/v2';
final _APIKey = 'd0a978261613462b91f55ddc6cb40a27';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = '$_urlNEWS/top-headlines?apiKey=$_APIKey&country=ar';

    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);
    this.headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
