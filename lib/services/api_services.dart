import 'package:http/http.dart' as http;
import 'package:movies/models/movies.dart';

class ApiServices {
  static var client = http.Client();

  static Future<MovieList> fetchMovies() async {
    var response = await client
        .get(Uri.parse('https://hoblist.com/previousweek?language=Kannada'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return moviesFromJson(jsonString);
    } else {
      return null;
    }
  }
}
