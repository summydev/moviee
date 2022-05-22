import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NetworkHelper {
  Future getData() async {
    var uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=d1794335c5152f45c147e347e22f7667');
    http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      String? data = response.body;
      print(data.length);
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
