import 'package:equatable/equatable.dart';

class Movie extends Equatable{

  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;
  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(json["id"],
        json["title"],
        json["vote_average"],
        json["overview"],
        json["poster_path"]);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id];

}