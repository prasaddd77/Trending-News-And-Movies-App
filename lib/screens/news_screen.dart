import 'package:flutter/material.dart';
import 'package:news_and_movies_app/models/article_model.dart';

import '../helper/news.dart';
import '../widgets/change_theme_button.dart';
import '../widgets/news_tile.dart';

class TrendingNews extends StatefulWidget {
  const TrendingNews({super.key});

  @override
  State<TrendingNews> createState() => _TrendingNewsState();
}

class _TrendingNewsState extends State<TrendingNews> {
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "Trending",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        actions: const [
             ChangeThemeButton(),
        ],
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: ListView.builder(
                itemCount: articles.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsTile(
                    title: articles[index].title,
                    desc: articles[index].description,
                    imgUrl: articles[index].urlToImage,
                    url: articles[index].url,
                  );
                },
              ),
            ),
    );
  }
}


