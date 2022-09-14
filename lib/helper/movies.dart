import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_model.dart';

class Movies {
  List<MovieModel> trendingMovies = [];

  Future<void> getNews() async {
    String url =
        'https://api.themoviedb.org/3/trending/all/day?api_key=54db9312636184b5395acdd125c684a4';

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);


    if (jsonData['results'] != null) {
      jsonData['results'].forEach(
        (element) {
          if (element["poster_path"] != null && element['title'] != null && element['overview'] != null ) {
            MovieModel movieModel = MovieModel(
              title: element['title'],
              description: element['overview'],
              imgUrl:
                  'https://image.tmdb.org/t/p/w500${element['poster_path']}',
            );
            trendingMovies.add(movieModel);
          }
        },
      );
    }
  }
}
