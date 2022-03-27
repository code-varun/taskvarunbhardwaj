import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:taskvarunbhardwaj/models/nowplaying_movie_model.dart';
import 'package:taskvarunbhardwaj/models/toprated_model.dart';

class detailMovies extends StatefulWidget {
  const detailMovies(
    this.image,
    this.title,
    this.summury, {
    this.nowplaying,
    this.toprated,
    Key? key,
  }) : super(key: key);

  final image, title, summury;

  final Movie? nowplaying;
  final Result? toprated;

  @override
  State<detailMovies> createState() => _detailMoviesState();
}

class _detailMoviesState extends State<detailMovies> {
  @override
  Widget build(BuildContext context) {
    return widget.nowplaying != null

        // Details page structure  for now playing  movies
        ? SafeArea(
            child: Stack(
              children: <Widget>[
                // place holder for image for i index movie
                Image.network(
                  'https://image.tmdb.org/t/p/w185${widget.image}',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(widget.title),
                      leading: InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.black,
                      elevation: 0.0,
                    ),
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      height: 44.0 + MediaQuery.of(context).padding.bottom,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[],
                      ),
                    ),
                    body: new Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: MediaQuery.of(context).size.height,
                      widthFactor: MediaQuery.of(context).size.width * 2,
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            width: 250.0,
                            height: 200.0,
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.5)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 12,
                                              ),
                                              Text(
                                                  widget.nowplaying!.popularity
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 75.0),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .volunteer_activism,
                                                        size: 12,
                                                      ),
                                                      Text(
                                                          widget.nowplaying!
                                                              .voteCount
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 12))
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.summury,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          )

        // Details page structure  for top rated movies
        : SafeArea(
            child: Stack(
              children: <Widget>[
                // place holder for image for i index movie
                Image.network(
                  'https://image.tmdb.org/t/p/w185${widget.image}',
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Scaffold(
                    backgroundColor: Colors.transparent,
                    appBar: AppBar(
                      centerTitle: true,
                      title: Text(widget.title),
                      leading: InkWell(
                        onTap: (() => Navigator.pop(context)),
                        child: Icon(
                          Icons.arrow_back_outlined,
                          color: Colors.white,
                        ),
                      ),
                      backgroundColor: Colors.black,
                      elevation: 0.0,
                    ),
                    bottomNavigationBar: Container(
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      height: 44.0 + MediaQuery.of(context).padding.bottom,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[],
                      ),
                    ),
                    body: new Align(
                      alignment: Alignment.bottomCenter,
                      heightFactor: MediaQuery.of(context).size.height,
                      widthFactor: MediaQuery.of(context).size.width * 2,
                      child: new ClipRect(
                        child: new BackdropFilter(
                          filter:
                              new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: new Container(
                            width: 250.0,
                            height: 200.0,
                            decoration: new BoxDecoration(
                                color: Colors.grey.shade200.withOpacity(0.5)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.star,
                                                size: 12,
                                              ),
                                              Text(
                                                  widget.toprated!.popularity
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 12)),
                                              SizedBox(height: 10),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 75.0),
                                                child: Container(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .volunteer_activism,
                                                        size: 12,
                                                      ),
                                                      Text(
                                                        widget
                                                            .toprated!.voteCount
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 12),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                                Container(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    widget.summury,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          );
  }
}
