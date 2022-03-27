import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' show Client;
import 'package:taskvarunbhardwaj/models/index.dart';
import 'package:taskvarunbhardwaj/utils/index.dart';

import 'dart:convert';

class ApiServices {
  static var client = Client();
  List<Movie> movie = [];
  List<Result> result = [];
  List<Result> searchResult = [];
  var nowplayingurl = Url.movieDbBaseUrl + Url.nowPlayingMovies;
  var topratedurl = Url.movieDbBaseUrl + Url.topRatedMovies;
  var searchmoviesurl = Url.movieDbBaseUrl + Url.searchUrlMovies;

// Now playing movies api service call via http  as client

  Future<List<Movie>> getNowPlayingMovie() async {
    var npurl = Uri.parse(nowplayingurl);
    var response = await client.post(npurl);
    if (response.statusCode == 200) {
      MovieWrapper moviewrapper = MovieWrapper.fromRawJson(response.body);

      for (int i = 0; i < moviewrapper.results.length; i++) {
        movie.add(moviewrapper.results[i]);
      }
    } else
      Get.snackbar('Error loading data ',
          'Server Responded: ${response.reasonPhrase.toString()}');

    return movie;
  }

// Top Rated  movies api service call via http  as client

  Future<List<Result>> getTopRatedMovies() async {
    var toprurl = Uri.parse(topratedurl);
    var response = await client.post(toprurl);
    if (response.statusCode == 200) {
      TopRated toprated = TopRated.fromJson(json.decode(response.body));

      for (int i = 0; i < toprated.results!.length; i++) {
        result.add(toprated.results![i]);
      }
    } else
      Get.snackbar('Error loading data ',
          'Server Responded: ${response.reasonPhrase.toString()}');
    return result;
  }

//  Searching movies via  api using  http  as client
  Future<List<Result>> getSearchedMovie(String? query) async {
    var searchResultUrl =
        Uri.parse("$searchmoviesurl&query=$query&page=1&include_adult=false");

    var response = await client.get(searchResultUrl);

    if (response.statusCode == 200) {
      TopRated searchModel = TopRated.fromJson(json.decode(response.body));

      for (int i = 0; i < searchModel.results!.length; i++) {
        result.add(searchModel.results![i]);
      }
    } else
      Get.snackbar('Error loading data ',
          'Server Responded: ${response.reasonPhrase.toString()}');

    return result;
  }
}
