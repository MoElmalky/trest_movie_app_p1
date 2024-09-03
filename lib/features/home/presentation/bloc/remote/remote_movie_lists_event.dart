part of 'remote_movie_lists_bloc.dart';

abstract class RemoteMovieListsEvent{
  const RemoteMovieListsEvent();
}

class GetMovieList extends RemoteMovieListsEvent{
  final MovieListParams params;
  const GetMovieList(this.params);
}