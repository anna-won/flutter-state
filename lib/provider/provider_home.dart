import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/app.dart';
import 'package:flutter_state/provider/movie_provider.dart';
import 'package:flutter_state/repository/movie_repository.dart';
import 'package:provider/provider.dart';

import '../bloc/bloc_home.dart';

class ProviderHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MovieProvider(MovieRepository()),
      child: ProviderMovieList(),
    );
  }

}

class ProviderMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _movieProvider = context.read<MovieProvider>();
    return Scaffold(
        appBar: AppBar(title: Text("Provider"),),
        body: Column(
          children: [
            ElevatedButton(onPressed: (){
                _movieProvider.getMovie();
            }, child: Text("Get MovieList")),
            TextField(onChanged: (value){
                _movieProvider.searchMovie(value);
            },textAlign: TextAlign.center,),
            Expanded(
                child: Consumer<MovieProvider>(
                  builder: (context, provider, child){
                    return Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView.separated(
                          itemBuilder: (context, index){
                            return MovieContainer(provider.movies[index]);
                          },
                          separatorBuilder: (context, index) => Divider(color: Colors.grey,),
                          itemCount: provider.movies.length),
                    );
                  },

                )

            )
          ],
        )
    );
  }
}
