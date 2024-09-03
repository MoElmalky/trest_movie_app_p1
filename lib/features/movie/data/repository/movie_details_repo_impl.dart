import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/data_state.dart';
import '../../../home/data/models/movie_model.dart';
import '../../domain/repository/movie_details_repo.dart';
import '../data_sources/remote/movie_details_service.dart';
import '../models/movie_details_model.dart';

class MovieDetailsRepoImpl implements MovieDetailsRepo {
  final MovieDetailsService _movieDetailsService;

  MovieDetailsRepoImpl(this._movieDetailsService);

  @override
  Future<DataState<MovieDetailsModel>> getMovieDetails(int id) async {
    try {
      final response =
          await _movieDetailsService.getMovieDetails(apiKey: apiKey, id: id);
      return _getDataState(response);
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  @override
  Future<DataState<List<MovieModel>>> getMovieSimilar(int id) async {
    try {
      final response =
          await _movieDetailsService.getMovieSimilar(apiKey: apiKey, id: id);
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
    } on DioException catch (error) {
      return DataFailed(error);
    }
  }

  DataState<MovieDetailsModel> _getDataState(
      HttpResponse<MovieDetailsModel> response) {
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
