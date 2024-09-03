import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/util/constants.dart';
import '../models/tmdb_user_model.dart';

part 'auth_services.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class AuthServices{

  factory AuthServices(Dio dio,{String baseUrl}) = _AuthServices;

  @GET('/authentication/token/new')
  Future<HttpResponse<String>> generateAccessToken({@Query('api_key') required String apiKey,});

  @GET('/authentication/guest_session/new')
  Future<HttpResponse<String>> generateGuestSession({@Query('api_key') required String apiKey,});

  @POST('/authentication/session/new')
  Future<HttpResponse<String>> getSessionId({
    @Query('api_key') required String apiKey,
    @Query('request_token') required String requestToken,
  });

  @GET('/account')
  Future<HttpResponse<TMDBUserModel>> getUserId({
    @Query('api_key') required String apiKey,
    @Query('session_id') required String sessionId,
  });
}
