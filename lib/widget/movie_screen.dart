import 'package:flutter/material.dart';

class MovieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie App'),
        backgroundColor: Colors.green,
      ),
      body: SafeArea(
          child: Column(
        children: [Text('movie')],
      )),
    );
  }
}
