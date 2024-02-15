import 'package:flutter_state/model/movie.dart';

abstract class MovieEvent {}

class GetMovieListEvent extends MovieEvent {}

class SearchMovieEvent extends MovieEvent {
  String searchKey;

  SearchMovieEvent(this.searchKey);

}