import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/common/error_displayer.dart';
import '../bloc/remote/remote_movie_lists_bloc.dart';
import 'temp.dart';

class TempHListView extends StatelessWidget {
  final String path;
  const TempHListView({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RemoteMovieListsBloc, RemoteMovieListsState>(
      builder: (context, state) {
        if (state is RemoteMovieListsLoading) {
          return const Center(
              child: RefreshProgressIndicator(
            strokeWidth: 4,
            indicatorPadding: EdgeInsets.all(5),
          ));
        } else if (state is RemoteMovieListsFailed) {
          return ErrorDisplayer(
              message: state.error!.response!.data['message'].toString());
        } else {
          return TempWidget(
            movieList: state.movieList!,
          );
        }
      },
    );
  }
}
