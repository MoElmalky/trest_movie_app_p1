import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/util/constants.dart';
import '../../../../home/data/models/movie_model.dart';
import '../../models/movie_details_model.dart';

part 'movie_details_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class MovieDetailsService{
  factory MovieDetailsService(Dio dio,{String baseUrl}) = _MovieDetailsService;

  @GET('/movie/{id}')
  Future<HttpResponse<MovieDetailsModel>> getMovieDetails({
    @Path() required int id,
    @Query('api_key') required String apiKey,
  });

  @GET('/movie/{id}/similar')
  Future<HttpResponse<List<MovieModel>>> getMovieSimilar({
    @Path() required int id,
    @Query('api_key') required String apiKey,
  });
}