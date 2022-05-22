import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({this.index, this.movieData});

  late int? index;
  final movieData;

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  late String overview;
  late int? index;
  @override
  void initState() {
    super.initState();
    update(widget.movieData);
    widget.index = index;
  }

  update(dynamic movieData) {
    overview = movieData[0]['overview'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            Text(
              '$overview',
            )
          ],
        ),
      ),
    );
  }
}
