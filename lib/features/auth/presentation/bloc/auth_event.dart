part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthEvent{
  final LoginModel params;

  const LoginEvent(this.params);
}

class SignUpEvent extends AuthEvent{

  final CreateUserParams params;

  const SignUpEvent(this.params);
}

class ConfirmSignUpEvent extends AuthEvent{
  const ConfirmSignUpEvent();
}

class LogoutEvent extends AuthEvent{
  const LogoutEvent();
}

class CheckUserEvent extends AuthEvent{
  const CheckUserEvent();
}

class GuestUserEvent extends AuthEvent{
  const GuestUserEvent();
}
