part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthChecking extends AuthState {
  const AuthChecking();
}

class Authenticated extends AuthState {
  const Authenticated();
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

class AuthGuest extends AuthState {
  const AuthGuest();
}

class AuthFaild extends AuthState{
  final DioException error;
  const AuthFaild(this.error);
}
