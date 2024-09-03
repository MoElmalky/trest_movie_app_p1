import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/parameters/move_list_params.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/data_state.dart';
import '../../domain/repository/movie_lists_repo.dart';
import '../data_sources/remote/movie_lists_service.dart';
import '../models/movie_model.dart';

class MovieListsRepoImpl implements MovieListsRepo {
  final MovieListsService _movieListsService;

  MovieListsRepoImpl(this._movieListsService);
  @override
  Future<DataState<List<MovieModel>>> getMovieList(
      MovieListParams params) async {
    try {
      final response = await _movieListsService.getMovieList(
          apiKey: apiKey,
          //accept: 'application/json',
          path: params.path,
          language: params.language,
          page: params.page,
          sortBy: params.sortBy);
      return _getDataState(response);
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  DataState<List<MovieModel>> _getDataState(
      HttpResponse<List<MovieModel>> response) {
    if (response.response.statusCode == HttpStatus.ok) {
      return DataSuccess(response.data);
    } else {
      return DataFailed(DioException(
        requestOptions: response.response.requestOptions,
        response: response.response,
        error: response.response.statusMessage,
        type: DioExceptionType.badResponse,
      ));
    }
  }
}
