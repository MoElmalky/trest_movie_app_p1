import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/util/constants.dart';
import '../../domain/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movie;
  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column( 
        children: [ 
          CachedNetworkImage(
            imageUrl: '$imagesBaseUrl${movie.posterPath}',
            ),
          Text(movie.title!),
        ],
      ),
    );
  }
}