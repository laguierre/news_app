import 'dart:convert';


NewsResponse newsResponseFromJson(String str) => NewsResponse .fromJson(json.decode(str));

String newsResponseToJson(NewsResponse  data) => json.encode(data.toJson());

class NewsResponse {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponse ({
    required this.status,
    required this.totalResults,
    required this.articles,
  });



  factory NewsResponse.fromJson(Map<String, dynamic> json) => NewsResponse(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "totalResults": totalResults,
    "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
  };
}

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });



  factory Article.fromJson(Map<String, dynamic> json) => Article(
    source: Source?.fromJson(json["source"]),
    author: json["author"] == null ? '' : json["author"],
    title: json["title"] == null ? '' : json["title"],
    description: json["description"] == null ? '' : json["description"],
    url: json["url"] == null ? '' : json["url"],
    urlToImage: json["urlToImage"] == null ? '' : json["urlToImage"],
    publishedAt: DateTime.parse(json["publishedAt"]),
    content: json["content"]== null ? '' : json["content"],
  );

  Map<String, dynamic> toJson() => {
    "source": source.toJson(),
    "author": author,
    "title": title,
    "description": description,
    "url": url,
    "urlToImage": urlToImage,
    "publishedAt": publishedAt.toIso8601String(),
    "content": content,
  };
}

class Source {
  String? id;
  String? name;

  Source({
    required this.id,
    required this.name,
  });



  factory Source.fromJson(Map<String, dynamic> json) => Source(
    id: json["id"] == null? null : json["id"],
    name: json["name"] == null? null : json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? '' : id,
    "name": name == null? '': name};
}