import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/bloc/movie_event.dart';
import 'package:flutter_state/bloc/movie_state.dart';
import 'package:flutter_state/repository/movie_repository.dart';

import '../model/movie.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final MovieRepository _movieRepository;

  MovieBloc(this._movieRepository) : super(MovieState(movieList: [])) {
    on<GetMovieListEvent>(_getMovie);
    on<SearchMovieEvent>(_searchMovie);
  }

  void _getMovie(event , emit ) async {
    await _movieRepository.loadMovies();
    emit(MovieState(movieList :  _movieRepository.movies));
  }

  void _searchMovie( SearchMovieEvent event , emit )  {
    var filterList = _movieRepository.searchMovie (event.searchKey);
    emit(MovieState(movieList :  filterList));
  }



}