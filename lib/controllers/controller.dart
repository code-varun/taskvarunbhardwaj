import 'package:get/get.dart';
import 'package:taskvarunbhardwaj/models/index.dart';
import 'package:taskvarunbhardwaj/services/api_services.dart';

class Controller extends GetxController {
  var movieList = <Movie>[].obs;
  var topratedlist = <Result>[].obs;
  var searchedmovieslist = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();
    getNowPlayingMovie();
    getTopRatedMovies();
  }

// Get now playing movies
  Future<List<Movie>> getNowPlayingMovie() async {
    var movies = await ApiServices().getNowPlayingMovie();
    movieList.value = movies;

    return movies;
  }

// GET top rated movies
  Future<List<Result>> getTopRatedMovies() async {
    var result = await ApiServices().getTopRatedMovies();
    topratedlist.value = result;

    return result;
  }

//  Get search movies
  Future<List<Result>> getSearchedMovie(String query) async {
    var result = await ApiServices().getSearchedMovie(query);
    searchedmovieslist.value = result;

    return result;
  }
}
