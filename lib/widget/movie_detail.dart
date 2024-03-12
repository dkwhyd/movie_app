import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

// ignore: must_be_immutable
class MovieDetail extends StatelessWidget {
  final Movie? movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';
  String? path;

  MovieDetail(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    if (movie!.posterPath != null) {
      path = imgPath + movie!.posterPath.toString();
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(
          child: Text(movie != null ? movie!.title.toString() : ''),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              height: height / 2,
              child: Center(
                child: Row(
                  children: [
                    Image.network(path.toString()),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Release:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline),
                                ),
                                Text(
                                  movie!.releaseDate.toString(),
                                  style: const TextStyle(),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Ratings:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline),
                                ),
                                Text(
                                  movie!.voteAverage.toString(),
                                  style: const TextStyle(),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(movie!.overview.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
