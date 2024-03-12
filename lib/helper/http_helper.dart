import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/movie.dart';

class HttpHelper {
  String urlKey = dotenv.env['API_KEY']!;
  final String urlBase = dotenv.env['BASE_URL']!;
  final String urlUpcoming = '/movie/upcoming?api_key=';
  final String urlLanguage = '&language=en-Us';
  final String urlSearchBase = '/search/movie?api_key=';
  final String urlQuery = '&query=';


  Future getUpComing() async {
    String uriUpcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    var url = Uri.parse(uriUpcoming);
    var result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }

  Future findMovies(String title) async {
    final String query = urlBase + urlSearchBase + urlKey + urlQuery + title;
    http.Response result = await http.get(Uri.parse(query));
    if (result.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List movies = moviesMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      return null;
    }
  }
}
