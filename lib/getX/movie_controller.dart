import 'package:get/get.dart';

import '../model/movie.dart';
import '../repository/movie_repository.dart';

class MovieController extends GetxController {

  List<Movie> _movieList = [];
  List<Movie> get movies => _movieList;

  final MovieRepository _movieRepository;

  MovieController(this._movieRepository);

  void getMovie() async {
    await _movieRepository.loadMovies();
    _movieList = _movieRepository.movies;
    update();

  }

  void searchMovie(String searchKey)  {
    var filterList = _movieRepository.searchMovie (searchKey);
    _movieList = filterList;
    update();
  }
  

}