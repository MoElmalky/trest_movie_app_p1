import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/theme/fonts.dart';
import '../../../../core/common/clickable_poster.dart';
import '../../../../core/common/error_displayer.dart';
import '../../../../core/common/movie_list_load_visual.dart';
import '../../../movie/presentation/pages/temp_movie_page.dart';
import '../bloc/remote/remote_movie_lists_bloc.dart';

class HorizontalMovieListView extends StatelessWidget {
  final Future Function() onInitial;
  final String listName;
  const HorizontalMovieListView(
      {super.key, required this.listName, required this.onInitial});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteMovieListsBloc, RemoteMovieListsState>(
      builder: (context, state) {
        if(state is RemoteMovieListsInitial){
          onInitial.call();
          return const MovieListLoadVisual();
        }
        else if (state is RemoteMovieListsLoading) {
          return const MovieListLoadVisual();
        } else if (state is RemoteMovieListsFailed) {
          return ErrorDisplayer( message: state.error!.type.name);
        } else {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      listName,
                      style: TRestFonts.mainB24,
                    ),
                    const Row(
                      children: [
                        Text(
                          'MORE',
                          style: TRestFonts.mainB12,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_sharp,
                          color: Colors.white,
                          size: 24,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...state.movieList!.map(
                      (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: ClickablePoster(
                            posterPath: e.posterPath!,
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TempMoviePage(id : e.id!)));
                            },
                          )),
                    )
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
