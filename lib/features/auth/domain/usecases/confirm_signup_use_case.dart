import 'package:hive_flutter/hive_flutter.dart';
import 'package:trest_movie_app_p1/features/auth/data/models/user_model.dart';

import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../repository/auth_repo.dart';

class ConfirmSignUpUseCase extends UseCase<DataState<String>, String> {
  final AuthRepo _authRepo;
  final userBox = Hive.box('userBox');

  ConfirmSignUpUseCase(this._authRepo);

  @override
  Future<DataState<String>> call({required String params}) async {
    String sessionId;
    int accountId;

    final sessionState = await _authRepo.getSessionId(params);

    if (sessionState is DataSuccess) {
      sessionId = sessionState.data!;
    } else {
      return DataFailed(sessionState.error!);
    }

    final accountState = await _authRepo.getUserId(sessionId);

    if (accountState is DataSuccess) {
      accountId = accountState.data!.id!;
    } else {
      return DataFailed(accountState.error!);
    }

    userBox.put('session_id', sessionId);
    userBox.put('account_id', accountId);
    userBox.put('country',accountState.data!.country);
    userBox.put('username',accountState.data!.userName);
    userBox.put('avatar',accountState.data!.avatarPath);

    final dataState = await _authRepo.signUp(UserModel(
        firstName: userBox.get('first_name'),
        lastName: userBox.get('last_name'),
        email: userBox.get('email'),
        password: userBox.get('password'),
        sessionId: userBox.get('session_id'),
        accountId: userBox.get('account_id'),
        country: userBox.get('country'),
        username: userBox.get('username'),
        avatar: userBox.get('avatar')
        ));

    if (dataState is DataFailed) {
      return DataFailed(dataState.error!);
    }

    return const DataSuccess('success');
  }
}
