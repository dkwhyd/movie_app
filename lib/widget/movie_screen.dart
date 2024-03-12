// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_app/widget/movie_list.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  Icon visibleIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Movies App');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        backgroundColor: Colors.green,
        actions: [IconButton(onPressed: () {}, icon: visibleIcon)],
      ),
      body: const SafeArea(
        child: MovieList(),
      ),
    );
  }
}
