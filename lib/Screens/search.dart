import 'package:flutter/material.dart';
import 'package:moviegoers/Screens/list.dart';
import 'package:moviegoers/Screens/opening.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  static const String _title = 'Movie Goers App';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: SearchBar(),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _controller = TextEditingController();
  // late final movieData title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Opening();
              }));
            }),
        title: Text('Search Movie'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xffF2DB83), Color(0xffDBA506)])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                  labelText: 'Movie Title',
                  labelStyle: new TextStyle(color: const Color(0xffDBA506))),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Color(0xffDBA506)),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieList(movieTitle: _controller.text);
                }));
              },
              child: SizedBox(
                  width: 75,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text('Search')
                      ])),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
