// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app/helper/http_helper.dart';

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

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext contex) {
    return Container(
      child: Text('movies count : $moviesCount'),
    );
  }

  Future<void> initialize() async {
    movies = await helper?.getUpComing();
    setState(() {
      moviesCount = movies?.length;
      movies = movies;
    });
  }
}
