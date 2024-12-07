import 'dart:convert';

import 'package:http/http.dart' as http;

class MovieServices {
  Future<List<dynamic>> popularMoviews() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDljMzEyMjM5MTc2NzFmZTU2Mzc4NWI4YTVjNmJhMSIsIm5iZiI6MTczMzI0MzYyOC4wODgsInN1YiI6IjY3NGYzMmVjZjU5NTIzNWFjYmUzY2EzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OGK8AAQsqw_8p0Z_XPWBJ54R-uJcaN2dZ64kmIl32mY ',
      'accept': 'application/json',
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      print(response.body.toString());
      return (json.decode(response.body))['results'];
    } else {
      throw Exception('Failed to get popular movies');
    }
  }

  Future<List<dynamic>> topRatedMoviews() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDljMzEyMjM5MTc2NzFmZTU2Mzc4NWI4YTVjNmJhMSIsIm5iZiI6MTczMzI0MzYyOC4wODgsInN1YiI6IjY3NGYzMmVjZjU5NTIzNWFjYmUzY2EzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OGK8AAQsqw_8p0Z_XPWBJ54R-uJcaN2dZ64kmIl32mY ',
      'accept': 'application/json',
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return  (json.decode(response.body))['results'];
    } else {
      throw Exception('Failed to get TopRated movies');
    }
  }

  Future<List<dynamic>> upcomingMoviews() async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDljMzEyMjM5MTc2NzFmZTU2Mzc4NWI4YTVjNmJhMSIsIm5iZiI6MTczMzI0MzYyOC4wODgsInN1YiI6IjY3NGYzMmVjZjU5NTIzNWFjYmUzY2EzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OGK8AAQsqw_8p0Z_XPWBJ54R-uJcaN2dZ64kmIl32mY ',
      'accept': 'application/json',
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return  (json.decode(response.body))['results'];
    } else {
      throw Exception('Failed to get Upcoming movies');
    }
  }

  Future<List<dynamic>> similarMovies(int movieID) async {
    final headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmZDljMzEyMjM5MTc2NzFmZTU2Mzc4NWI4YTVjNmJhMSIsIm5iZiI6MTczMzI0MzYyOC4wODgsInN1YiI6IjY3NGYzMmVjZjU5NTIzNWFjYmUzY2EzZSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.OGK8AAQsqw_8p0Z_XPWBJ54R-uJcaN2dZ64kmIl32mY ',
      'accept': 'application/json',
    };
    final response = await http.get(
        Uri.parse(
            'https://api.themoviedb.org/3/movie/$movieID/similar?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      return  (json.decode(response.body))['results'];
    } else {
      throw Exception('Failed to get Similar movies');
    }
  }
}
