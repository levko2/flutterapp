import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class Api {
  Future<List> search(String text) async {
    var response = await http.get('https://newsapi.org/v2/everything?q=' +
        text +
        '&apiKey=fc3b81a64eec43e69e6224690721381a');

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);

      if (jsonResponse == null || jsonResponse["articles"] == null) return null;

      return jsonResponse["articles"];
    } else {
      return null;
    }
  }
}
