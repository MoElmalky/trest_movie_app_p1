import '../../../../core/util/data_state.dart';
import '../../data/models/email_model.dart';
import '../../data/models/login_model.dart';
import '../../data/models/user_model.dart';
import '../entities/tmdb_user_entity.dart';
import '../entities/user_entity.dart';

abstract class AuthRepo{

  Future<DataState<String>> signUp(UserModel user);

  Future<DataState<UserEntity>> login(LoginModel user);

  Future<DataState<String>> sendEmail(EmailModel email);

  Future<DataState<String>> generateAccessToken();

  Future<DataState<String>> generateGuestSession();

  Future<DataState<String>> getSessionId(String requestToken);

  Future<DataState<TMDBUserEntity>> getUserId(String sessionId);
}