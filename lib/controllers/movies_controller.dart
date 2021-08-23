import 'package:get/state_manager.dart';
import 'package:movies/models/movies.dart';
import 'package:movies/services/api_services.dart';

class MovieController extends GetxController {
  // ignore: deprecated_member_use
  var movieList = List<Movie>().obs;

  @override
  void onInit() {
    fetchMovies();
    super.onInit();
  }

  void fetchMovies() async {
    var movies = await ApiServices.fetchMovies();
    if (movies != null) {
      movieList.value = movies.movies;
    } else {
      print('null');
    }
  }
}
