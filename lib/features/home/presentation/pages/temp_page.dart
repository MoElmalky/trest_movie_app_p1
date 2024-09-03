import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trest_movie_app_p1/config/theme/colors.dart';
//import 'package:trest_movie_app_p1/config/theme/colors.dart';
//import '../widgets/test.dart';
//import 'package:trest_movie_app_p1/features/home/presentation/widgets/test2.dart';
//import '../../../../core/common/error_displayer.dart';
import '../../../../core/parameters/move_list_params.dart';
import '../../../../injection_container.dart';
import '../bloc/remote/remote_movie_lists_bloc.dart';
//import '../widgets/temp.dart';
import '../widgets/temp2.dart';

class TempPage extends StatelessWidget {
  const TempPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          BlocProvider<RemoteMovieListsBloc>(
            create: (context) => instance()
              ..add(const GetMovieList(
                  MovieListParams(path: 'now_playing', page: 1))),
            child: const TempHListView(path: 'now_playing'),
          ),
          /*
          BlocProvider<RemoteMovieListsBloc>(
            create: (context) => instance()
              ..add(const GetMovieList(
                  MovieListParams(path: 'top_rated', page: 1))),
            child: const TempHListView(path: 'top_rated'),
          ),
          Container(
            height: 100,
            width: 100,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [TRestColors.primary,TRestColors.secondaryDark],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                )
            ),
          ),
          */
          //const LoadingTextAnimation(),
          Shimmer.fromColors(
            baseColor: Colors.transparent,
            highlightColor: TRestColors.tertiary.withOpacity(.5),
            period: const Duration(milliseconds: 1200),
              child: Column(
                children: [
                  Container(
                    height: 240,
                    width: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 20,
                    width: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
