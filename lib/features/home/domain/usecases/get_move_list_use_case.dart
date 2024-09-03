import '../../../../core/parameters/move_list_params.dart';
import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../entities/movie_entity.dart';
import '../repository/movie_lists_repo.dart';

class GetMovieListUseCase extends UseCase<DataState<List<MovieEntity>>,MovieListParams>{

  final MovieListsRepo _movieListsRepo;

  GetMovieListUseCase(this._movieListsRepo);

  @override
  Future<DataState<List<MovieEntity>>> call({required MovieListParams params}) async {
    return await _movieListsRepo.getMovieList(params);
  }

}