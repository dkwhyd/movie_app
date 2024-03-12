import 'package:flutter/material.dart';
import 'package:movie_app/model/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie? movie;

  const MovieDetail(this.movie, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie != null ? movie!.title.toString() : ''),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Text(movie!.overview.toString()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
