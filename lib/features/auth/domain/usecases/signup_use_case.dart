import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/parameters/create_user_params.dart';
import '../../../../core/util/constants.dart';
import '../../../../core/util/data_state.dart';
import '../../../../core/util/usecase.dart';
import '../../data/models/email_model.dart';
import '../repository/auth_repo.dart';

class SignUpUseCase extends UseCase<DataState<String>, CreateUserParams> {
  final AuthRepo _authRepo;
  final userBox = Hive.box('userBox');

  SignUpUseCase(this._authRepo);

  @override
  Future<DataState<String>> call({required CreateUserParams params}) async {
    String requestToken;

    userBox.put('first_name', params.firstName);
    userBox.put('last_name', params.lastName);
    userBox.put('email', params.email);
    userBox.put('password', params.password);

    final tokenState = await _authRepo.generateAccessToken();

    if (tokenState is DataSuccess) {
      requestToken = tokenState.data!;
    } else {
      return DataFailed(tokenState.error!);
    }

    final emailState = await _authRepo.sendEmail(EmailModel(
      to: params.email,
      subject: 'Welcome To T-Rest!',
      body: """
            Hi,${params.firstName} ${params.lastName}
            Thank You For Signing Up In T-Rest By Malky.\n
            Please, Go To The URL Below To Confirm Your T-Rest Account And Link It With TMDB.\n
            $confirmationBaseUrl$requestToken
      """
    ));

    if(emailState is DataFailed){
      print(emailState.error!.message.toString());
      return DataFailed(emailState.error!);
    }

    return DataSuccess(requestToken);
  }
}
