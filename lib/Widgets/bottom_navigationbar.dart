import 'package:flutter/material.dart';
import 'package:taskvarunbhardwaj/screens/homepage/homepage.dart';
import 'package:taskvarunbhardwaj/screens/searching/seachbar_top.dart';
import 'package:taskvarunbhardwaj/screens/toprated/binding/topratedpage.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    // Now playing movies tab
    Container(child: HomepageMovies()),

    // top rated movies  tab
    Container(
      child: TopRated(),
    )
  ];

  void _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Search Movies "),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: SearchAppBar());
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter_rounded),
            label: 'Now Playing',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: 'TOP RATED',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
