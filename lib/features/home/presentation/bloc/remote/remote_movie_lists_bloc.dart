import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/parameters/move_list_params.dart';
import '../../../../../core/util/data_state.dart';
import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_move_list_use_case.dart';

part 'remote_movie_lists_event.dart';
part 'remote_movie_lists_state.dart';

class RemoteMovieListsBloc
    extends Bloc<RemoteMovieListsEvent, RemoteMovieListsState> {
  final GetMovieListUseCase _movieListUseCase;

  RemoteMovieListsBloc(this._movieListUseCase)
      : super(const RemoteMovieListsInitial()) {
    on<GetMovieList>(onGetMovieList);
  }

  void onGetMovieList(
      GetMovieList event, Emitter<RemoteMovieListsState> emit) async {
    emit(const RemoteMovieListsLoading());
    print('{{[[[[[[[[${event.params.path}]]]]]]]]}}');
    await Future.delayed(Durations.long2);
    final dataState = await _movieListUseCase(params: event.params);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteMovieListsSuccess(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RemoteMovieListsFailed(dataState.error!));
    }
  }
}
