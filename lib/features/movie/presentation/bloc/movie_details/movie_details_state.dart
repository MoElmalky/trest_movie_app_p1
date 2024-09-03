part of 'movie_details_bloc.dart';

abstract class MovieDetailsState extends Equatable {
  final MovieDetailsEntity? movieDetails;
  final DioException? error;
  const MovieDetailsState({this.movieDetails, this.error});

  @override
  List<Object?> get props => [movieDetails, error];
}

class MovieDetailsLoading extends MovieDetailsState {
  const MovieDetailsLoading();
}

class MovieDetailsSuccess extends MovieDetailsState {
  const MovieDetailsSuccess(MovieDetailsEntity movieDetails)
      : super(movieDetails: movieDetails);
}

class MovieDetailsFailed extends MovieDetailsState {
  const MovieDetailsFailed(DioException error) : super(error: error);
}
