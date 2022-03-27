import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskvarunbhardwaj/Widgets/index.dart';
import 'package:taskvarunbhardwaj/controllers/controller.dart';
import 'package:taskvarunbhardwaj/models/index.dart';

class SearchAppBar extends SearchDelegate {
  var _controller = Get.find<Controller>();
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          _controller.searchedmovieslist.clear();
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        child: query == "null"
            ? Container(child: CircularProgressIndicator())
            : FutureBuilder<List<Result>>(
                future: _controller.getSearchedMovie(query),
                builder: (context, AsyncSnapshot) {
                  return _controller.searchedmovieslist.length == 0
                      ? Container(
                          child: Center(
                              child: Text("No Movies Found.Try another movie")),
                        )
                      : ListView.builder(
                          itemCount: _controller.searchedmovieslist.length,
                          itemBuilder: (BuildContext context, int postion) {
                            return InkWell(
                              onTap: () {
                                Get.to(BottomNavBar());
                              },
                              child: Card(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                6,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        child: Image.network(
                                            'https://image.tmdb.org/t/p/w185${_controller.searchedmovieslist[postion].posterPath ?? ""}')),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Column(
                                          children: [
                                            Align(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                '${_controller.searchedmovieslist[postion].originalTitle}',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              child: Text(
                                                '${_controller.searchedmovieslist[postion].overview}',
                                                style: TextStyle(fontSize: 12),
                                                overflow: TextOverflow.ellipsis,
                                                textDirection:
                                                    TextDirection.ltr,
                                                textAlign: TextAlign.start,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                }));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Movies "),
    );
  }
}
