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
        title: Text('Movie Goers App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Movie Title',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieList(movieTitle: _controller.text);
                }));
              },
              child: Text('Search'),
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
