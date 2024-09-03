import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_displayer.dart';
import '../bloc/remote/remote_movie_lists_bloc.dart';
import 'front_movie_poster.dart';
import 'front_movies_load_visual.dart';

class FrontMoviesSlider extends StatelessWidget {
  final Future Function() onInitial;
  const FrontMoviesSlider({super.key, required this.onInitial});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteMovieListsBloc, RemoteMovieListsState>(
      builder: (context, state) {
        if (state is RemoteMovieListsInitial) {
          onInitial.call();
          return const FrontMoviesLoadVisual();
        } else if (state is RemoteMovieListsLoading) {
          return const FrontMoviesLoadVisual();
        } else if (state is RemoteMovieListsFailed) {
          return ErrorDisplayer( message: state.error!.type.name);
        } else {
          return CarouselSlider(
            items: List.generate(
                5,
                (i) => state.movieList![i].posterPath != null
                    ? FrontMoviePoster(
                        posterPath: state.movieList![i].posterPath!,
                        title: state.movieList![i].title!,
                        genreIds: state.movieList![i].genreIds!)
                    : Text(state.movieList![i].title!)),
            options: CarouselOptions(
                viewportFraction: 1,
                height: MediaQuery.of(context).size.width * 1.5,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5)),
          );
        }
      },
    );
  }
}
