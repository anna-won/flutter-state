import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state/getX/movie_controller.dart';
import 'package:flutter_state/repository/movie_repository.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class GetXHome extends StatelessWidget {

  final contoller = Get.put(MovieController(MovieRepository()));
  @override
  Widget build(BuildContext context) {
    return GetXMovieList();
  }

}

class GetXMovieList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
