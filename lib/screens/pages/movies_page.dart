import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/widgets/movie_details.dart';
import 'package:movie_sphere/screens/services/movie_services.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<dynamic> upComingMovies = [];
  bool _isLoading = true;
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    MovieServices movieServices = MovieServices();
    upComingMovies = await movieServices.upcomingMoviews();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Movies',style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          color: Colors.orangeAccent

        ),),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 2,
              children: List.generate(
                upComingMovies.length,
                (index) {
                  final movie = upComingMovies[index];
                  return GestureDetector(
                    onTap: () {
                        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie),
                  ),
                );
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 5,
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              'https://image.tmdb.org/t/p/w200${movie['backdrop_path']}',
                              width: double.infinity,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              movie['title'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
