import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../entities/movie_details_entity.dart';
import '../repository/movie_details_repo.dart';

class GetMovieDetailsUseCase extends UseCase<DataState<MovieDetailsEntity>,int>{
  final MovieDetailsRepo _movieDetailsRepo;

  GetMovieDetailsUseCase(this._movieDetailsRepo);

  @override
  Future<DataState<MovieDetailsEntity>> call({required int params}) async {
    return await _movieDetailsRepo.getMovieDetails(params);
  }

}