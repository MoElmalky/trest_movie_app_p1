import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_displayer.dart';
import '../../../../injection_container.dart';
import '../../../home/presentation/widgets/temp.dart';
import '../bloc/movie_details/movie_details_bloc.dart';
import '../bloc/movie_similar/movie_similar_bloc.dart';

class TempMoviePage extends StatelessWidget {
  final int id;
  const TempMoviePage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocProvider<MovieDetailsBloc>(
            create: (context) => instance()..add(GetMovieDetails(id)),
            child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
              builder: (context, state) {
                if (state is MovieDetailsLoading) {
                  return const Center(
                      child: RefreshProgressIndicator(
                    strokeWidth: 4,
                    indicatorPadding: EdgeInsets.all(5),
                  ));
                } else if (state is MovieDetailsFailed) {
                  return ErrorDisplayer(
                      message:
                          state.error!.response!.data['message'].toString());
                } else {
                  return SizedBox(
                    height: 400,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: Text(state.movieDetails!.title!),
                        ),
                        SizedBox(
                          height: 100,
                          child: Text(state.movieDetails!.tagline!),
                        ),
                        SizedBox(
                          height: 100,
                          child: Text(state.movieDetails!.overview!),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
          BlocProvider<MovieSimilarBloc>(
            create: (context) => instance()..add(GetMovieSimilar(id)),
            child: BlocBuilder<MovieSimilarBloc, MovieSimilarState>(
                builder: (context, state) {
              if (state is MovieSimilarLoading) {
                return const Center(
                    child: RefreshProgressIndicator(
                  strokeWidth: 4,
                  indicatorPadding: EdgeInsets.all(5),
                ));
              } else if (state is MovieSimilarFailed) {
                return ErrorDisplayer(
                    message: state.error!.response!.data['message'].toString());
              } else {
                return TempWidget(
                  movieList: state.moveSimilar!,
                );
              }
            }),
          )
        ],
      ),
    );
  }
}
