part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvent extends Equatable {
  const MovieDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetails extends MovieDetailsEvent{
  final int id;
  const GetMovieDetails(this.id);
}

