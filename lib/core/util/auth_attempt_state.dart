abstract class AuthAttemptState<T>{
  final T? data;
  final AuthAttemptFailer? failer;

  const AuthAttemptState({this.data, this.failer});
}

class AuthAttemptSuccess<T> extends AuthAttemptState<T>{
  const AuthAttemptSuccess(T data):super(data: data);
}

class AuthAttemptFailed extends AuthAttemptState{
  const AuthAttemptFailed(AuthAttemptFailer error):super(failer: error);
}

abstract class AuthAttemptFailer{
  final String? error;

  const AuthAttemptFailer(this.error);
}

class GenerateTokenFailer extends AuthAttemptFailer{
  const GenerateTokenFailer(super.error);
}

class SendEmailFailer extends AuthAttemptFailer{
  const SendEmailFailer(super.error);
}

class GetSessionIdFailer extends AuthAttemptFailer{
  const GetSessionIdFailer(super.error);
}

class GetUserIdFailer extends AuthAttemptFailer{
  const GetUserIdFailer(super.error);
}

class SignUpFailer extends AuthAttemptFailer{
  const SignUpFailer(super.error);
}

class LoginFailer extends AuthAttemptFailer{
  const LoginFailer(super.error);
}