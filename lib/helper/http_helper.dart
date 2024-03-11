import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHelper {
  String urlKey = dotenv.env['API_KEY']!;
  final String urlBase = dotenv.env['BASE_URL']!;
  final String urlUpcoming = '/upcoming?api_key=';
  final String urlLanguage = '&language=en-Us';

  Future getUpComing() async {
    String uriUpcoming = urlBase + urlUpcoming + urlKey + urlLanguage;
    var url = Uri.parse(uriUpcoming);
    var result = await http.get(url);
    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      print(responseBody.toString());
      return responseBody;
    } else {
      return null;
    }
  }
}
