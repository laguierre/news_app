import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/scr/models/category_model.dart';
import 'package:news_app/scr/models/news_models.dart';
import 'package:http/http.dart' as http;

const _urlNEWS = 'https://newsapi.org/v2';
const _APIKey = 'd0a978261613462b91f55ddc6cb40a27';
const _Country = 'ar';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];
  String _selectedCategory = 'business';

  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  NewsService() {
    getTopHeadLines();
    for (var item in categories) {
      categoryArticles[item.name] = [];
    }
    getArticlesByCategory(_selectedCategory);
  }

  bool get isLoading => _isLoading;

  set selectedCategory(String value) {
    _selectedCategory = value;
    _isLoading = true;
    getArticlesByCategory(value);
    notifyListeners();
  }

  String get selectedCategory => _selectedCategory;

  List<Article>? get getSelectedArticlesCategory =>
      categoryArticles[selectedCategory];

  getTopHeadLines() async {
    final url = '$_urlNEWS/top-headlines?apiKey=$_APIKey&country=$_Country';

    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);
    headlines.addAll(newsResponse.articles);
    print(newsResponse.articles);
    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (categoryArticles[category]!.length > 0) {
      this._isLoading = false;
      notifyListeners();
      return categoryArticles[category];
    }
    final url =
        '$_urlNEWS/top-headlines?apiKey=$_APIKey&country=$_Country&category=$category';

    final resp = await http.get(Uri.parse(url));
    final newsResponse = newsResponseFromJson(resp.body);
    categoryArticles[category]!.addAll(newsResponse.articles);
    this._isLoading = false;
    notifyListeners();
  }
}
