import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../../../../core/util/constants.dart';
import '../models/user_model.dart';

part 'remote_database_services.g.dart';

@RestApi(baseUrl: usersApiBaseUrl)
abstract class RemoteDatabaseServices{

  factory RemoteDatabaseServices(Dio dio,{String baseUrl}) = _RemoteDatabaseServices;

  @POST('/auth/signup')
  Future<HttpResponse<String>> signUp(@Body() Map<String,dynamic> user);

  @POST('/auth/login')
  Future<HttpResponse<UserModel>> login(@Body() Map<String,dynamic> user);

  @POST('/send_email')
  Future<HttpResponse<String>> sendEmail(@Body() Map<String,dynamic> user);

}