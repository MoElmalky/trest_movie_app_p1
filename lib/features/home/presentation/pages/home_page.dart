import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/background_container.dart';
import '../../../../core/parameters/move_list_params.dart';
import '../../../../injection_container.dart';
import '../bloc/remote/remote_movie_lists_bloc.dart';
import '../widgets/front_movies_slider.dart';
import '../widgets/horizontal_movie_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nowPlayingBloc =
        instance<RemoteMovieListsBloc>(instanceName: 'now_playing');
    final popularBloc = instance<RemoteMovieListsBloc>(instanceName: 'popular');
    final topRatedBloc =
        instance<RemoteMovieListsBloc>(instanceName: 'top_rated');
    final upcomingBloc =
        instance<RemoteMovieListsBloc>(instanceName: 'upcoming');
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BackgroundContainer(),
            RefreshIndicator(
              onRefresh: () async {
                nowPlayingBloc.add(
                    const GetMovieList(MovieListParams(path: 'now_playing')));
                popularBloc
                    .add(const GetMovieList(MovieListParams(path: 'popular')));
                topRatedBloc.add(
                    const GetMovieList(MovieListParams(path: 'top_rated')));
                upcomingBloc
                    .add(const GetMovieList(MovieListParams(path: 'upcoming')));
              },
              child: ListView(
                children: [
                  BlocProvider.value(
                    value: nowPlayingBloc,
                    child: FrontMoviesSlider(
                      onInitial: () async => nowPlayingBloc.add(
                          const GetMovieList(
                              MovieListParams(path: 'now_playing'))),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  BlocProvider.value(
                    value: popularBloc,
                    child: HorizontalMovieListView(
                      onInitial: () async => popularBloc.add(
                          const GetMovieList(MovieListParams(path: 'popular'))),
                      listName: 'Popular Movies',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocProvider.value(
                    value: topRatedBloc,
                    child: HorizontalMovieListView(
                      onInitial: () async => topRatedBloc.add(
                          const GetMovieList(
                              MovieListParams(path: 'top_rated'))),
                      listName: 'Top Rated Movies',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  BlocProvider.value(
                    value: upcomingBloc,
                    child: HorizontalMovieListView(
                      onInitial: () async => upcomingBloc.add(
                          const GetMovieList(
                              MovieListParams(path: 'upcoming'))),
                      listName: 'Upcoming Movies',
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}