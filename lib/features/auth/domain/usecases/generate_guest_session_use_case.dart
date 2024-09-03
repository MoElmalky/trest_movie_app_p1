import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../repository/auth_repo.dart';

class GenerateGuestSessionUseCase extends UseCase<DataState<String>,void>{
  final AuthRepo _authRepo;

  GenerateGuestSessionUseCase(this._authRepo);

  @override
  Future<DataState<String>> call({required void params}) async {
    return await _authRepo.generateGuestSession();
  }
  
}