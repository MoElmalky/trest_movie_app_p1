
import '../../../../core/util/data_state.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../entities/movie_details_entity.dart';

abstract class MovieDetailsRepo{

  Future<DataState<MovieDetailsEntity>> getMovieDetails(int id);

  Future<DataState<List<MovieEntity>>> getMovieSimilar(int id);
  
}