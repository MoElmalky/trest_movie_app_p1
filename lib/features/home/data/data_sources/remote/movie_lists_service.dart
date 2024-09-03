import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/util/constants.dart';
import '../../models/movie_model.dart';

part 'movie_lists_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class MovieListsService{
  factory MovieListsService(Dio dio,{String baseUrl}) = _MovieListsService;

  @GET('/movie/{path}')
  Future<HttpResponse<List<MovieModel>>> getMovieList({
    //@Header("Authorization") required String apiKey,
    //@Header("accept") required String accept,
    @Path() required String path,
    @Query('language') String? language,
    @Query('page') int? page,
    @Query('sort_by') String? sortBy,
    @Query('api_key') required String apiKey,
  });
}