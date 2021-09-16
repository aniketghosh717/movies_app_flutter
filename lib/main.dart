import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:hello_movies/models/movie.dart';
import 'package:hello_movies/widgets/moviesWidget.dart';
import 'package:hello_movies/widgets/searchbar.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _App createState() => _App();

}

class _App extends State<App> {

  List<Movie> _movies = new List<Movie>();

  @override
  void initState() {
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final movies = await _fetchAllMovies();
    setState(() {
      _movies = movies;
    });
  }


  Future<List<Movie>> _fetchAllMovies() async {
    final response = await http.get("http://www.omdbapi.com/?s=Avengers&page=1&apikey=4f6d9f97");

    if(response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Movies App",
        home: Scaffold(
            appBar: AppBar(

                actions: [
                  SearchAppBar()
                ],


            ),


            body: Container(

                child: MoviesWidget(movies: _movies)
            )
        )
    );

  }
}
