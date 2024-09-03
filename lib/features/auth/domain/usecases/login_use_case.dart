import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../../data/models/login_model.dart';
import '../repository/auth_repo.dart';

class LoginUseCase extends UseCase<DataState<String>, LoginModel> {
  final AuthRepo _authRepo;
  final userBox = Hive.box('userBox');

  LoginUseCase(this._authRepo);

  @override
  Future<DataState<String>> call({required LoginModel params}) async {
    final dataState = await _authRepo.login(params);

    if (dataState is DataFailed) {
      return DataFailed(dataState.error!);
    }

    userBox.put('first_name', dataState.data!.firstName);
    userBox.put('last_name', dataState.data!.lastName);
    userBox.put('email', dataState.data!.email);
    userBox.put('password', dataState.data!.password);
    userBox.put('session_id', dataState.data!.sessionId);
    userBox.put('account_id', dataState.data!.accountId);
    userBox.put('country', dataState.data!.country);
    userBox.put('username', dataState.data!.username);
    userBox.put('avatar', dataState.data!.avatar);

    return const DataSuccess('success');
  }
}
