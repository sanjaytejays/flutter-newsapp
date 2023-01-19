import 'dart:convert';

class NewsArticle {
  String urlToImage;
  String title;
  String content;
  String url;
  String publishedAt;
  NewsArticle({
    required this.urlToImage,
    required this.title,
    required this.content,
    required this.url,
    required this.publishedAt,
  });

  static NewsArticle fromApiToNews(Map<String, dynamic> article) {
    return NewsArticle(
      urlToImage: article["urlToImage"] ??
          "https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png",
      content: article["content"] ??
          "Sorry...Content is not available!!...............",
      title: article["title"] ?? "Sorry...Title is not available!!",
      publishedAt: article['publishedAt'] ?? "__/__/__",
      url: article['url'] ??
          'https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en',
    );
  }
}
