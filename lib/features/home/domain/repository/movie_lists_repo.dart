import '../../../../core/parameters/move_list_params.dart';
import '../../../../core/util/data_state.dart';
import '../entities/movie_entity.dart';

abstract class MovieListsRepo{
  Future<DataState<List<MovieEntity>>> getMovieList(MovieListParams params);
}