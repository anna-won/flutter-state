import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state/bloc/movie_bloc.dart';
import 'package:flutter_state/bloc/movie_event.dart';
import 'package:flutter_state/bloc/movie_state.dart';
import 'package:flutter_state/repository/movie_repository.dart';

import '../model/movie.dart';

class BlocHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BlocHomeState();

}

class _BlocHomeState extends State<BlocHome> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => MovieRepository(),
      child: BlocProvider(
        create: (context) => MovieBloc(context.read<MovieRepository>()),
        child: BlocMovieList(),
      ),
    );
  }
}


class BlocMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Bloc"),),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
            context.read<MovieBloc>().add(GetMovieListEvent());
          }, child: Text("Get MovieList")),
          TextField(onChanged: (value){
            context.read<MovieBloc>().add(SearchMovieEvent(value));
          },textAlign: TextAlign.center,),
          Expanded(
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state){
                  return Padding(
                    padding: EdgeInsets.all(20),
                    child: ListView.separated(
                        itemBuilder: (context, index){
                          return MovieContainer(state.movieList[index]);
                        },
                        separatorBuilder: (context, index) => Divider(color: Colors.grey,),
                        itemCount: state.movieList.length),
                  );
                },

              )

          )
        ],
      )
    );
  }
}

class MovieContainer extends StatelessWidget{

  final Movie _movie;

  MovieContainer(this._movie);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Image.network("${MovieRepository.posterImagePath}${_movie.posterPath}",width: 100, height: 100, ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_movie.title, overflow: TextOverflow.fade,),
                Text(_movie.voteAverage.toString())
              ],
            ),
          )
        ]
      ),
    );

  }

}