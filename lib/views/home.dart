import 'package:flutter/material.dart';
import 'package:news/models/article_model.dart';
import 'package:news/views/news_card.dart';

import '../controllers/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsArticle newsArticle;
  bool isLoading = true;

  getNews() async {
    newsArticle = await FetchApi.fetchdata();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: PageController(initialPage: 0),
        scrollDirection: Axis.vertical,
        onPageChanged: (value) {
          setState(() {
            isLoading = true;
          });
          getNews();
        },
        itemBuilder: (context, index) {
          return isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : NewsCard(
                  content: newsArticle.content,
                  title: newsArticle.title,
                  urlToImage: newsArticle.urlToImage,
                  url: newsArticle.url,
                  publishedAt: newsArticle.publishedAt,
                );
        },
      ),
    );
  }
}
