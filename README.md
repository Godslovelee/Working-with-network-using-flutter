# Working_with_network
with the help of chopper and json serializable to
create/generate api mode files.

# Implementation
```yaml


dependencies:
  flutter:
    sdk: flutter
  chopper: ^3.0.2
  provider: ^4.0.5
  json_annotation: ^3.0.1
  logging: ^0.11.4
  ```

# UI
```dart

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
```


A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
