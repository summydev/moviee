import 'package:flutter/material.dart';
import 'package:movie_app_api/utilities/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieScreen extends StatefulWidget {
  MovieScreen({
    this.movieDataInfo,
  });
  final movieDataInfo;

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  late dynamic movieDataInfo;
  late int poster_pathL;

  late int index;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.movieDataInfo);
  }

  updateUI(dynamic movieData) {
    late String results;

    movieDataInfo = movieData['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 10, 26),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 10, 26),
        foregroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Moviee',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Container(
            height: 480,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, _) => SizedBox(
                width: 22,
              ),
              itemCount: movieDataInfo.length,
              itemBuilder: (BuildContext context, int index) {
                index == index;
                return Card(
                  elevation: 5.0,
                  shadowColor: Color.fromARGB(255, 203, 210, 224),
                  color: Color.fromARGB(255, 2, 10, 26),
                  child: Container(
                    width: 235.0,
                    child: Column(
                      children: [
                        Container(
                          height: 350,
                          child: Image.network(
                            'https://image.tmdb.org/t/p/w500' +
                                movieDataInfo[index]['poster_path'],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                movieDataInfo[index]['title'],
                                style: kTitleTextStyle,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 30.0,
                                child: Text(
                                  movieDataInfo[index]['overview'],
                                  style: koverviewTextStyle,
                                ),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) => Container(
                                                color: Color(0xff01050d),
                                                child: Container(
                                                  decoration:
                                                      kshowModalSheetStyle,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Center(
                                                          child: Container(
                                                            height: 250,
                                                            child:
                                                                Image.network(
                                                              'https://image.tmdb.org/t/p/w500' +
                                                                  movieDataInfo[
                                                                          index]
                                                                      [
                                                                      'backdrop_path'],
                                                            ),
                                                          ),
                                                        ),
                                                        Divider(
                                                          color: Colors.yellow,
                                                        ),
                                                        Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: <Widget>[
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      movieDataInfo[index]
                                                                              [
                                                                              'popularity']
                                                                          .toString(),
                                                                      style:
                                                                          kPopularityValue),
                                                                  Text(
                                                                      'Popularity',
                                                                      style:
                                                                          kPopularityTextStyle),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Icon(
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .yellowAccent,
                                                                    size: 20,
                                                                  ),
                                                                  Text(
                                                                    movieDataInfo[index]
                                                                            [
                                                                            'vote_average']
                                                                        .toString(),
                                                                    style:
                                                                        kPopularityTextStyle,
                                                                  ),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: <
                                                                    Widget>[
                                                                  Text(
                                                                      movieDataInfo[index]
                                                                              [
                                                                              'vote_count']
                                                                          .toString(),
                                                                      style:
                                                                          kPopularityValue),
                                                                  Text(
                                                                      'Vote Count',
                                                                      style:
                                                                          kPopularityTextStyle),
                                                                ],
                                                              ),
                                                            ]),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical:
                                                                      14.0,
                                                                  horizontal:
                                                                      14.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'DESCRIPTION',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(
                                                                  height: 10.0),
                                                              Text(
                                                                movieDataInfo[
                                                                        index][
                                                                    'overview'],
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15.0,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Center(
                                                          child: FlatButton(
                                                              onPressed:
                                                                  () async {
                                                                final url = 'https://www.themoviedb.org/movie/' +
                                                                    movieDataInfo[index]
                                                                            [
                                                                            'id']
                                                                        .toString();
                                                                ;
                                                                if (await canLaunch(
                                                                    url)) {
                                                                  await launch(
                                                                      url,
                                                                      forceWebView:
                                                                          true,
                                                                      forceSafariVC:
                                                                          false);
                                                                }
                                                              },
                                                              color: Colors
                                                                  .yellowAccent,
                                                              child: Text(
                                                                  'Watch Now')),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ));
                                    },
                                    child: Text(
                                      'Read More',
                                      style: TextStyle(
                                          fontSize: 15.0, color: Colors.white),
                                    ),
                                  ),
                                  Icon(Icons.keyboard_double_arrow_right_sharp,
                                      color: Colors.white),
                                  SizedBox(
                                    width: 80.0,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellowAccent,
                                    size: 12,
                                  ),
                                  Text(
                                      movieDataInfo[index]['vote_average']
                                          .toString(),
                                      style: kPopularityTextStyle),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
