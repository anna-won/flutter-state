import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/movie.dart';

class MovieRepository {
  List<Movie> _movieLists= [];
  List<Movie> get movies => _movieLists;

  var queryParams = {"api_key" : "cb48508b05ea65e638d76ef0c727cd04"};
  static final String posterImagePath = "https://image.tmdb.org/t/p/w500";

  loadMovies() async {
    var uri = Uri.https("api.themoviedb.org", "3/movie/popular", queryParams);
    var response = await http.get(uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> responseJson = jsonDecode(response.body);
      if (responseJson["results"] != null) {
        var movieResults = (responseJson["results"] as List).map((item) =>
            Movie.fromJson(item)).toList();
        _movieLists = movieResults;
      }
    }
  }

  List<Movie> searchMovie(String key) {
      return _movieLists.where((movie) => movie.title.contains(key)).toList();
  }



}