import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:trest_movie_app_p1/features/auth/domain/usecases/generate_guest_session_use_case.dart';

import 'core/util/logging_interceptor.dart';
import 'features/auth/data/data_sources/auth_services.dart';
import 'features/auth/data/data_sources/remote_database_services.dart';
import 'features/auth/data/repository/auth_repo_impl.dart';
import 'features/auth/domain/repository/auth_repo.dart';
import 'features/auth/domain/usecases/confirm_signup_use_case.dart';
import 'features/auth/domain/usecases/login_use_case.dart';
import 'features/auth/domain/usecases/signup_use_case.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/home/data/data_sources/remote/movie_lists_service.dart';
import 'features/home/data/repository/movie_lists_repo_impl.dart';
import 'features/home/domain/repository/movie_lists_repo.dart';
import 'features/home/domain/usecases/get_move_list_use_case.dart';
import 'features/home/presentation/bloc/remote/remote_movie_lists_bloc.dart';
import 'features/movie/data/data_sources/remote/movie_details_service.dart';
import 'features/movie/data/repository/movie_details_repo_impl.dart';
import 'features/movie/domain/repository/movie_details_repo.dart';
import 'features/movie/domain/usecases/get_movie_details_use_case.dart';
import 'features/movie/domain/usecases/get_movie_similar_use_case.dart';
import 'features/movie/presentation/bloc/movie_details/movie_details_bloc.dart';
import 'features/movie/presentation/bloc/movie_similar/movie_similar_bloc.dart';

final instance = GetIt.instance;

Future initializeDependencies() async {
  //Dio
  instance.registerSingleton<Dio>(Dio());

  instance<Dio>().interceptors.add(LoggingInterceptor());

  //Api Services
  instance.registerSingleton<MovieListsService>(MovieListsService(instance()));

  instance
      .registerSingleton<MovieDetailsService>(MovieDetailsService(instance()));

  instance.registerSingleton<AuthServices>(AuthServices(instance()));

  instance.registerSingleton<RemoteDatabaseServices>(
      RemoteDatabaseServices(instance()));

  //Repositories
  instance.registerSingleton<MovieListsRepo>(MovieListsRepoImpl(instance()));

  instance
      .registerSingleton<MovieDetailsRepo>(MovieDetailsRepoImpl(instance()));

  instance.registerSingleton<AuthRepo>(AuthRepoImpl(
      instance<AuthServices>(), instance<RemoteDatabaseServices>()));

  //Use Cases
  instance
      .registerSingleton<GetMovieListUseCase>(GetMovieListUseCase(instance()));

  instance.registerSingleton<GetMovieDetailsUseCase>(
      GetMovieDetailsUseCase(instance()));

  instance.registerSingleton<GetMovieSimilarUseCase>(
      GetMovieSimilarUseCase(instance()));

  instance.registerSingleton<SignUpUseCase>(SignUpUseCase(instance()));

  instance.registerSingleton<ConfirmSignUpUseCase>(
      ConfirmSignUpUseCase(instance()));

  instance.registerSingleton<LoginUseCase>(LoginUseCase(instance()));

  instance.registerSingleton<GenerateGuestSessionUseCase>(
      GenerateGuestSessionUseCase(instance()));

  //BLoCs

  instance.registerSingleton<RemoteMovieListsBloc>(
      RemoteMovieListsBloc(instance()),
      instanceName: 'now_playing');

  instance.registerSingleton<RemoteMovieListsBloc>(
      RemoteMovieListsBloc(instance()),
      instanceName: 'popular');

  instance.registerSingleton<RemoteMovieListsBloc>(
      RemoteMovieListsBloc(instance()),
      instanceName: 'top_rated');

  instance.registerSingleton<RemoteMovieListsBloc>(
      RemoteMovieListsBloc(instance()),
      instanceName: 'upcoming');

  instance
      .registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(instance()));

  instance
      .registerFactory<MovieSimilarBloc>(() => MovieSimilarBloc(instance()));

  instance.registerFactory<AuthBloc>(() => AuthBloc(
      instance<SignUpUseCase>(),
      instance<ConfirmSignUpUseCase>(),
      instance<LoginUseCase>(),
      instance<GenerateGuestSessionUseCase>()));
}
