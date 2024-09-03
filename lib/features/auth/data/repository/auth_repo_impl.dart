import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/util/constants.dart';
import '../../../../core/util/data_state.dart';
import '../../domain/entities/tmdb_user_entity.dart';
import '../../domain/repository/auth_repo.dart';
import '../data_sources/auth_services.dart';
import '../data_sources/remote_database_services.dart';
import '../models/email_model.dart';
import '../models/login_model.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthServices _authServices;
  final RemoteDatabaseServices _remoteDatabaseServices;

  AuthRepoImpl(this._authServices, this._remoteDatabaseServices);

  @override
  Future<DataState<UserModel>> login(LoginModel user) async {
    try {
      final response = await _remoteDatabaseServices.login(user.toJson());
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

  @override
  Future<DataState<String>> signUp(UserModel user) async {
    try {
      final response = await _remoteDatabaseServices.signUp(user.toJson());
      if (response.response.statusCode == HttpStatus.created) {
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

  @override
  Future<DataState<String>> sendEmail(EmailModel email) async {
    try {
      final response = await _remoteDatabaseServices.sendEmail(email.toJson());
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

  @override
  Future<DataState<String>> generateAccessToken() async {
    try {
      final response = await _authServices.generateAccessToken(apiKey: apiKey);
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

  @override
  Future<DataState<String>> generateGuestSession() async {
    try {
      final response = await _authServices.generateGuestSession(apiKey: apiKey);
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

  @override
  Future<DataState<String>> getSessionId(String requestToken) async {
    try {
      final response = await _authServices.getSessionId(
          apiKey: apiKey, requestToken: requestToken);
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

  @override
  Future<DataState<TMDBUserEntity>> getUserId(String sessionId) async {
    try {
      final response =
          await _authServices.getUserId(apiKey: apiKey, sessionId: sessionId);
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
}
