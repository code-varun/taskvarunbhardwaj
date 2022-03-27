import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskvarunbhardwaj/controllers/controller.dart';
import '../details/bindings/detailspage.dart';

class HomepageMovies extends StatefulWidget {
  const HomepageMovies({Key? key}) : super(key: key);

  @override
  State<HomepageMovies> createState() => _HomepageMoviesState();
}

class _HomepageMoviesState extends State<HomepageMovies> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<Controller>();

    return Obx(() => Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    key: _scaffoldkey,
                    itemCount: _controller.movieList.length,
                    itemBuilder: (BuildContext context, int postion) {
                      return InkWell(
                        onTap: () {
                          Get.to(detailMovies(
                            _controller.movieList[postion].posterPath,
                            _controller.movieList[postion].originalTitle,
                            _controller.movieList[postion].overview,
                            nowplaying: _controller.movieList[postion],
                          ));
                        },
                        child: Card(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // image place holder for now playing movies cards
                              Container(
                                  height:
                                      MediaQuery.of(context).size.height / 6,
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: Image.network(
                                      'https://image.tmdb.org/t/p/w185${_controller.movieList[postion].posterPath ?? ""}')),

                              // title place holder for now playing movies cards
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          '${_controller.movieList[postion].originalTitle}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),

                                      // some movie info  place holder for now playing movies cards
                                      Container(
                                        child: Text(
                                          '${_controller.movieList[postion].overview}',
                                          style: TextStyle(fontSize: 12),
                                          overflow: TextOverflow.ellipsis,
                                          textDirection: TextDirection.ltr,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //  delete entry icon from the list
                              InkWell(
                                  child: Icon(Icons.delete_forever_outlined),
                                  onTap: () {
                                    _controller.movieList.removeAt(postion);
                                    setState(() {
                                      _scaffoldkey = GlobalKey();
                                    });
                                  }),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ),
        ));
  }
}
