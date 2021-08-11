import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chopper/chopper.dart';
import 'package:working_with_network/models/movie_list.dart';
import 'package:working_with_network/models/model_list.dart';
import 'package:working_with_network/services/movie_service_api.dart';

class MovieListUI extends StatefulWidget {
  const MovieListUI({Key key}) : super(key: key);

  @override
  _MovieListUIState createState() => _MovieListUIState();
}

class _MovieListUIState extends State<MovieListUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NEXT"),
      ),
      body: _buildBody(context),
    );
  }
  // 1
  FutureBuilder<Response<MovieStreamList>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<MovieStreamList>>(
      // 2
      future: Provider.of<MovieService>(context).getPopularMovies(),
      builder: (context, snapshot) {
        // 3
        if (snapshot.connectionState == ConnectionState.done) {
          // 4
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }
          // 5
          final popular = snapshot.data.body;
          // 6
          return _buildMovieList(context, popular);
        } else {
          // 7
          // Show a loading indicator while waiting for the movies
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildMovieList(BuildContext context, MovieStreamList popular) {
    
    // 1
    return ListView.builder(
      // 2
      itemCount: popular.results.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        // 3
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        // 4
                          image: NetworkImage(
                              IMAGE_URL + popular.results[index].posterPath),
                          fit: BoxFit.contain)),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        // 5
                        Text(popular.results[index].title,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: Container(
                                child: Text(
                                  // 6
                                  popular.results[index].overview,
                                  style: TextStyle(fontSize: 12),
                                ))),
                      ],
                    ),
                  ),
                )
              ],
            ),          ),
        );
      },
    );

  }
  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";






}



























