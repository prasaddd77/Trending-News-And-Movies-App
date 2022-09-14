import 'package:flutter/material.dart';
import 'package:news_and_movies_app/models/article_model.dart';
import 'package:news_and_movies_app/screens/news_screen.dart';
import 'movie_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> articles = <ArticleModel>[];
  final screens = [
    const TrendingNews(),
    const TrendingMovies(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        type: BottomNavigationBarType.shifting,
        iconSize: 30,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: "Trending News",
            backgroundColor: Colors.cyan,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined),
              label: "Trending Movies",
              backgroundColor: Colors.indigo),
        ],
      ),
    );
  }
}
