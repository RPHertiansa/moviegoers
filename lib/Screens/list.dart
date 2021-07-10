import 'package:flutter/material.dart';
import 'package:moviegoers/Screens/detail.dart';
import '../models/movieList.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieList extends StatelessWidget {
  final String movieTitle;

  MovieList({required this.movieTitle});
  Future<MovieListData> getMoviesList(movieTitle) async {
    final response = await http.get(
        Uri.parse('http://www.omdbapi.com/?apikey=1b60a4ef&s=$movieTitle'));

    if (response.statusCode == 200) {
      return MovieListData.fromJson(json.decode(response.body)["Search"]);
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<dynamic>> _fecthDataUsers(movieTitle) async {
    var result = await http.get(
        Uri.parse("http://www.omdbapi.com/?apikey=1b60a4ef&s=$movieTitle'"));
    return json.decode(result.body)['Search'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
      ),
      body: Container(
        child: FutureBuilder<List<dynamic>>(
          future: _fecthDataUsers(movieTitle),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return MovieDetail(
                                imdbID: snapshot.data[index]['imdbID']);
                          }));
                        }, //function lambda
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                NetworkImage(snapshot.data[index]['Poster']),
                          ),
                          title: Text(snapshot.data[index]['Title'] +
                              " " +
                              snapshot.data[index]['Year']),
                          subtitle: Text(snapshot.data[index]['imdbID']),
                        ));
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListView.builder(
  //     itemBuilder: (context, index) {
  //       //looping data dari model
  //       final TourismPlace place = tourismPlaceList[index];
  //       // final MovieListData movieListData
  //       return InkWell(
  //         onTap: () {
  //           Navigator.push(context, MaterialPageRoute(builder: (context) {
  //             return MovieDetail(imdbID: place);
  //           }));
  //         }, //function lambda
  //         child: Card(
  //           child: Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Expanded(
  //                 flex: 1,
  //                 child: Image.asset(place.imageAsset),
  //               ),
  //               Expanded(
  //                   flex: 2,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: <Widget>[
  //                         Text(
  //                           place.name,
  //                           style: TextStyle(fontSize: 16),
  //                         ),
  //                         SizedBox(
  //                           height: 10,
  //                         ),
  //                         Text(place.location)
  //                       ],
  //                     ),
  //                   )),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //     itemCount: tourismPlaceList.length,
  //   );
  // }
}

class MovieListGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: GridView.count(
        crossAxisCount: 4,
        children: [],
      ),
    );
  }
}
