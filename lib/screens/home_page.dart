import 'dart:convert';
import 'network.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'movie_screen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getmovieData();
  }

  Future<void> getmovieData() async {
    NetworkHelper networkHelper = NetworkHelper();
    var movieData = await networkHelper.getData();
    //print(movieData);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MovieScreen(
        movieDataInfo: movieData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 10, 26),
      body: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Moviee',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40.0,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            CircularProgressIndicator(
              color: Color.fromARGB(255, 2, 10, 26),
              backgroundColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
