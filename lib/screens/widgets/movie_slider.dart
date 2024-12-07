// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  final List<dynamic> topRatedMovies;
  const MovieSlider({
    super.key,
    required this.topRatedMovies,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: topRatedMovies.length,
        itemBuilder: (context, index, realIndex) {
          final movie = topRatedMovies[index];
          return GestureDetector(
            onTap: (){},
            child: ClipRRect(
              borderRadius:BorderRadius.circular(12),
              child: Image.network('https://image.tmdb.org/t/p/w500${movie['backdrop_path']}',fit: BoxFit.cover,),
            ),
          );
        },
        options: CarouselOptions(
          height: 250,
          autoPlay: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          enableInfiniteScroll: true,
          pageSnapping: true,
          enlargeCenterPage: true,
          viewportFraction: 0.8,
        ));
  }
}
