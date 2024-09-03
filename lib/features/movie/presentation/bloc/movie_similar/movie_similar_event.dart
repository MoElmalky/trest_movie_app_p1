part of 'movie_similar_bloc.dart';

abstract class MovieSimilarEvent extends Equatable {
  const MovieSimilarEvent();

  @override
  List<Object> get props => [];
}

class GetMovieSimilar extends MovieSimilarEvent{
  final int id;
  const GetMovieSimilar(this.id);
}
