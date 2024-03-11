import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHelper {
  String urlKey = dotenv.env['API_KEY']!;
  final String urlBase = dotenv.env['BASE_URL']!;
  final String urlUpcoming = '/upcoming?';
  final String urlLanguage = '&language=en-Us';

  Future getUpComing() async {
    final String upcoming = urlBase + urlUpcoming + urlLanguage;
    http.Response result = await http.get(upcoming as Uri);

    if (result.statusCode == HttpStatus.ok) {
      String responseBody = result.body;
      print(responseBody.toString());
      return responseBody;
    } else {
      return null;
    }
  }
}
