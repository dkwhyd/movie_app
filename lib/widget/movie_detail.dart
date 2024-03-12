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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Center(
                      child: Image.network(
                        path.toString(),
                        width: 500,
                        height: height / 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
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
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Ratings:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline),
                          ),
                          Text(
                            movie!.voteAverage.toString(),
                            style: const TextStyle(),
                          ),
                          const Text(
                            'Overview:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline),
                          ),
                          Text(
                            movie!.overview.toString(),
                            style: const TextStyle(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
