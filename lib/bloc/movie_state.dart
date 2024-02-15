import 'package:equatable/equatable.dart';

import '../model/movie.dart';

class MovieState extends Equatable {
  final List<Movie> movieList;
  const MovieState({
    required this.movieList
  });

  const MovieState.init() : this(movieList: const []);

  MovieState copyWith({
    List<Movie>? list
}){
    return MovieState(movieList: list ?? this.movieList);
  }

  @override
  List<Object?> get props => [movieList];
}