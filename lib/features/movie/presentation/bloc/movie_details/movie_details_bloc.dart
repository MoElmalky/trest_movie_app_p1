import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/util/data_state.dart';
import '../../../domain/entities/movie_details_entity.dart';
import '../../../domain/usecases/get_movie_details_use_case.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {

  final GetMovieDetailsUseCase _movieDetailsUseCase;
  MovieDetailsBloc(this._movieDetailsUseCase) : super(const MovieDetailsLoading()) {
    on<GetMovieDetails> (onGetMovieDetails);
  }

  void onGetMovieDetails(GetMovieDetails event, Emitter<MovieDetailsState> emit) async {
    emit(const MovieDetailsLoading());

    final dataState = await _movieDetailsUseCase(params: event.id);

    if (dataState is DataSuccess) {
      emit(MovieDetailsSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(MovieDetailsFailed(dataState.error!));
    }
  }
}
