// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app/helper/http_helper.dart';
import 'package:movie_app/widget/movie_detail.dart';

class MovieList extends StatefulWidget {
  const MovieList({super.key});

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State {
  HttpHelper? helper;
  String? result;

  int? moviesCount;
  List? movies;

  final String iconBase = 'https://image.tmdb.org/t/p/w92/';
  final String defaultImage =
      'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

  Icon visibleIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Movies App');

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext contex) {
    NetworkImage image;
    return Scaffold(
        appBar: AppBar(
          title: searchBar,
          backgroundColor: Colors.green,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (visibleIcon.icon == Icons.search) {
                      visibleIcon = const Icon(Icons.cancel);
                      searchBar = TextField(
                        textInputAction: TextInputAction.search,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        onSubmitted: (text) {
                          search(text);
                        },
                      );
                    } else {
                      setState(() {
                        visibleIcon = const Icon(Icons.search);
                        searchBar = const Text('Movies');
                        initialize();
                      });
                    }
                  });
                },
                icon: visibleIcon)
          ],
        ),
        body: Container(
          child: movies != null
              ? ListView.builder(
                  itemCount: moviesCount,
                  itemBuilder: (BuildContext context, int position) {
                    if (movies?[position].posterPath != null) {
                      image =
                          NetworkImage(iconBase + movies?[position].posterPath);
                    } else {
                      image = NetworkImage(defaultImage);
                    }
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: image,
                        ),
                        title: Text(
                          movies == null ? '' : movies?[position].title,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          'Released: ${movies == null ? '' : movies?[position].releaseDate} - Vote: ${movies?[position].voteAverage.toString()}',
                        ),
                        onTap: () {
                          detailMovie(position);
                        },
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text('Loading...'),
                ),
        ));
  }

  Future<void> initialize() async {
    movies = await helper?.getUpComing();
    setState(() {
      moviesCount = movies?.length;
      movies = movies;
    });
  }

  Future search(String text) async {
    movies = await helper!.findMovies(text);
    setState(() {
      moviesCount = movies!.length;
      movies = movies;
    });
  }

  void detailMovie(int position) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => MovieDetail(movies?[position])));
  }
}
