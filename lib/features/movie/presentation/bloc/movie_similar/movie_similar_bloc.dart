import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/data_state.dart';
import '../../../../home/domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_movie_similar_use_case.dart';

part 'movie_similar_event.dart';
part 'movie_similar_state.dart';

class MovieSimilarBloc extends Bloc<MovieSimilarEvent, MovieSimilarState> {
  final GetMovieSimilarUseCase _movieSimilarUseCase;
  MovieSimilarBloc(this._movieSimilarUseCase)
      : super(const MovieSimilarLoading()) {
    on<GetMovieSimilar>(onGetMovieSimilar);
  }

  void onGetMovieSimilar(
      GetMovieSimilar event, Emitter<MovieSimilarState> emit) async {
    emit(const MovieSimilarLoading());

    final dataState = await _movieSimilarUseCase(params: event.id);

    if (dataState is DataSuccess) {
      emit(MovieSimilarSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(MovieSimilarFailed(dataState.error!));
    }
  }
}
