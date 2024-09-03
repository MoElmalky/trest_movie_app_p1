part of 'movie_similar_bloc.dart';

abstract class MovieSimilarState extends Equatable {
  final List<MovieEntity>? moveSimilar;
  final DioException? error;

  const MovieSimilarState({this.moveSimilar, this.error});

  @override
  List<Object?> get props => [moveSimilar, error];
}

class MovieSimilarLoading extends MovieSimilarState {
  const MovieSimilarLoading();
}

class MovieSimilarSuccess extends MovieSimilarState {
  const MovieSimilarSuccess(List<MovieEntity>? moveSimilar)
      : super(moveSimilar: moveSimilar);
}

class MovieSimilarFailed extends MovieSimilarState {
  const MovieSimilarFailed(DioException error) : super(error: error);
}
