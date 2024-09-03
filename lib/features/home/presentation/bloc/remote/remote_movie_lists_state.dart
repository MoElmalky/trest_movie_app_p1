part of 'remote_movie_lists_bloc.dart';

abstract class RemoteMovieListsState extends Equatable {
  final List<MovieEntity>? movieList;
  final DioException? error;
  const RemoteMovieListsState({this.error, this.movieList});

  @override
  List<Object?> get props => [movieList, error];
}

class RemoteMovieListsInitial extends RemoteMovieListsState{
  const RemoteMovieListsInitial();
}

class RemoteMovieListsLoading extends RemoteMovieListsState {
  const RemoteMovieListsLoading();
}

class RemoteMovieListsSuccess extends RemoteMovieListsState{
  const RemoteMovieListsSuccess(List<MovieEntity> movieList) :super(movieList: movieList);
}

class RemoteMovieListsFailed extends RemoteMovieListsState{
  const RemoteMovieListsFailed(DioException error) :super(error: error);
}
