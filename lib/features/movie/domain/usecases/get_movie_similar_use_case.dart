import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../../../home/domain/entities/movie_entity.dart';
import '../repository/movie_details_repo.dart';

class GetMovieSimilarUseCase extends UseCase<DataState<List<MovieEntity>>,int>{
  final MovieDetailsRepo _movieDetailsRepo;

  GetMovieSimilarUseCase(this._movieDetailsRepo);

  @override
  Future<DataState<List<MovieEntity>>> call({required int params}) async {
    return await _movieDetailsRepo.getMovieSimilar(params);
  }

}