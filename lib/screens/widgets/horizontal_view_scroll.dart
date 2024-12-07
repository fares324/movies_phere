// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:movie_sphere/screens/widgets/movie_details.dart';

class HorizontalView extends StatelessWidget {
  final List<dynamic> movies;
  const HorizontalView({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          movies.length,
          (index) {
            final movie = movies[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetails(movie: movie),
                  ),
                );
              },
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    Image.network(
                       movie['poster_path'] != null
      ? 'https://image.tmdb.org/t/p/w200${movie['poster_path']}'
      : 'https://hopeworx.org.uk/assets/bizpro/image/sorry-no-current-vacancies.jpg', // Your custom placeholder image URL
  width: 150,
  height: 200,
  fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      child: Text(movie['title']),
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
