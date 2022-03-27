import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskvarunbhardwaj/controllers/controller.dart';
import 'package:taskvarunbhardwaj/screens/details/bindings/detailspage.dart';


class TopRated extends StatefulWidget {
  const TopRated({Key? key}) : super(key: key);

  @override
  State<TopRated> createState() => _TopRatedState();
}

class _TopRatedState extends State<TopRated> {
  GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var _controller = Get.find<Controller>();

    return Obx(
      () => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  key: _scaffoldkey,
                  itemCount: _controller.topratedlist.length,
                  itemBuilder: (BuildContext context, int pos) {
                    return InkWell(
                      onTap: () {
                        Get.to(detailMovies(
                          _controller.topratedlist[pos].posterPath,
                          _controller.topratedlist[pos].originalTitle,
                          _controller.topratedlist[pos].overview,
                          toprated: _controller.topratedlist[pos],
                        ));
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // image place holder for top rated   movies cards
                            Container(
                                height: MediaQuery.of(context).size.height / 6,
                                width: MediaQuery.of(context).size.width / 4,
                                child: Image.network(
                                    'https://image.tmdb.org/t/p/w185${_controller.topratedlist[pos].posterPath ?? ""}')),
                            Expanded(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Column(
                                  children: [
                                    // title place holder for top rated   movies cards
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        '${_controller.topratedlist[pos].originalTitle}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),

                                    // some info place holder for top rated   movies cards
                                    Container(
                                      child: Text(
                                        '${_controller.topratedlist[pos].overview}',
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
                            // del functionality  for top rated  movies cards
                            InkWell(
                                child: Icon(Icons.delete_forever_outlined),
                                onTap: () {
                                  _controller.topratedlist.removeAt(pos);
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
      ),
    );
  }
}
