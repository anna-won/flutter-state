import 'package:flutter/cupertino.dart';
import 'package:flutter_state/repository/movie_repository.dart';

import '../model/movie.dart';

class MovieProvider with ChangeNotifier {

  List<Movie> _movieList = [];
  List<Movie> get movies => _movieList;

  final MovieRepository _movieRepository;

  MovieProvider(this._movieRepository);

  void getMovie() async {
    await _movieRepository.loadMovies();
    _movieList = _movieRepository.movies;
    notifyListeners();
  }

  void searchMovie(String searchKey)  {
    var filterList = _movieRepository.searchMovie (searchKey);
    _movieList = filterList;
    notifyListeners();
  }


}