import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/services/movie_services.dart';
import 'package:movie_sphere/screens/widgets/filtered_movies_list_item.dart';
import 'package:movie_sphere/screens/widgets/horizontal_view_scroll.dart';
import 'package:movie_sphere/screens/widgets/movie_slider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> popularMovies = [];
  List<dynamic> topRatedMovies = [];
  List<dynamic> upComingMovies = [];
  List<dynamic> filteredMovies = [];
  bool _isSearchEmpty = true;
  bool _isLoading = true;
  void filterMovies(String query) {
    setState(() {
      filteredMovies = popularMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          upComingMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList() +
          topRatedMovies
              .where((movie) =>
                  movie['title'].toLowerCase().contains(query.toLowerCase()))
              .toList();
      if (query.isEmpty) {
        _isSearchEmpty = true;
      } else {
        _isSearchEmpty = false;
      }
    });
  }

  Widget SearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3)),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: TextField(
        onChanged: (value) {
          if (value.isEmpty) {
            _isSearchEmpty = true;
          } else {
            filterMovies(value);
          }
        },
        decoration: const InputDecoration(
            hintText: 'Search for movies',
            hintStyle: TextStyle(
                // color: Colors.orange,
                fontStyle: FontStyle.italic,
                fontSize: 18),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 25,
            ),
            prefixIconColor: Colors.orange),
      ),
    );
  }

  @override
  void initState() {
    fetchMovies();
    super.initState();
  }

  fetchMovies() async {
    MovieServices movieService = MovieServices();
    popularMovies = await movieService.popularMoviews();
    topRatedMovies = await movieService.topRatedMoviews();
    upComingMovies = await movieService.upcomingMoviews();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          SearchBar(),
          _isLoading
              ? const CircularProgressIndicator() :
              !_isSearchEmpty?
              Column(
                children: [
                  const Padding(padding: EdgeInsets.all(16),
                  child: Text("Filtered Movies",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.orangeAccent
                  ),), 
                  
                  ),
                  FilteredMoviesListItem(movies: filteredMovies)
                  
                ],
              )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 16,
                      ),
                      child: Text(
                        'Top Rated Movies',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ),
                    MovieSlider(topRatedMovies: topRatedMovies),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        'Upcoming Movies',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HorizontalView(movies: upComingMovies),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: Text(
                        'Popular Movies',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    HorizontalView(movies: popularMovies),
                  ],
                )

          // Add your movie list here...
        ],
      ),
    );
  }
}
