import 'package:flutter/material.dart';
import 'package:news_and_movies_app/helper/movies.dart' as movies;
import 'package:news_and_movies_app/widgets/movies_tile.dart';

import '../models/movie_model.dart';
import '../widgets/change_theme_button.dart';

class TrendingMovies extends StatefulWidget {
  const TrendingMovies({super.key});

  @override
  State<TrendingMovies> createState() => _TrendingMoviesState();
}

class _TrendingMoviesState extends State<TrendingMovies> {
  List<MovieModel> trendingMovies = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getMovies();
  }

  getMovies() async {
    movies.Movies movieClass = movies.Movies();
    await movieClass.getNews();
    trendingMovies = movieClass.trendingMovies;
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
              "Movies",
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
                itemCount: trendingMovies.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return MoviesTile(
                    imgUrl: trendingMovies[index].imgUrl,
                    title: trendingMovies[index].title,
                    desc: trendingMovies[index].description,
                  );
                },
              ),
            ),
    );
  }
}
