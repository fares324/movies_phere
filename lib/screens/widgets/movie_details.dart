// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/services/movie_services.dart';
import 'package:movie_sphere/screens/widgets/horizontal_view_scroll.dart';

class MovieDetails extends StatefulWidget {
  final dynamic movie;
  const MovieDetails({
    super.key,
    required this.movie,
  });

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  List<dynamic> movies = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    MovieServices movieServices = MovieServices();
    movies = await movieServices.similarMovies(widget.movie['id']);
    setState(() {
      movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie['title']),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
  widget.movie['backdrop_path'] != null
      ? 'https://image.tmdb.org/t/p/w500${widget.movie['backdrop_path']}'
      : 'https://hopeworx.org.uk/assets/bizpro/image/sorry-no-current-vacancies.jpg', // Your custom placeholder image URL
  width: double.infinity,
  height: 200,
  fit: BoxFit.cover,
),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                const Text(
                  'Title:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '${widget.movie['title']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
           
            const SizedBox(
              height: 10,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                const Text(
                  'Overview:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(
                  '${widget.movie['overview']}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
             Wrap(
              children: [
                const Text(
                  'Release Date:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
              '${widget.movie['release_date']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
           
           
            const SizedBox(
              height: 10,
            ),
             Wrap(
              children: [
                const Text(
                  'Rating:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
              ' ${widget.movie['vote_average']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
           
           
            const SizedBox(
              height: 10,
            ),
             Wrap(
              children: [
                const Text(
                  'Vote Count:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
               Text(
              ' ${widget.movie['vote_count']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
           
           
            const SizedBox(
              height: 10,
            ),
             Wrap(
              children: [
                const Text(
                  'Popularity:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orangeAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              Text(
              ' ${widget.movie['popularity']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
              ],
            ),
           
           
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Similar Movies',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            HorizontalView(movies: movies)
          ],
        ),
      ),
    );
  }
}
