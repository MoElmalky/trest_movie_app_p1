import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/parameters/create_user_params.dart';
import '../../../../core/util/data_state.dart';
import '../../data/models/login_model.dart';
import '../../domain/usecases/confirm_signup_use_case.dart';
import '../../domain/usecases/generate_guest_session_use_case.dart';
import '../../domain/usecases/login_use_case.dart';
import '../../domain/usecases/signup_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final userBox = Hive.box('userBox');
  final SignUpUseCase _signUpUseCase;
  final ConfirmSignUpUseCase _confirmUseCase;
  final LoginUseCase _loginUseCase;
  final GenerateGuestSessionUseCase _guestSessionUseCase;

  AuthBloc(this._signUpUseCase, this._confirmUseCase, this._loginUseCase,
      this._guestSessionUseCase)
      : super(const AuthInitial()) {
    on<SignUpEvent>(onSignUp);
    on<ConfirmSignUpEvent>(onConfirmSignUp);
    on<LoginEvent>(onLogin);
    on<LogoutEvent>(onLogout);
    on<CheckUserEvent>(onCheckUser);
    on<GuestUserEvent>(onGuestUser);
  }

  void onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthChecking());
    final dataState = await _signUpUseCase(params: event.params);

    if (dataState is DataSuccess) {
      userBox.put('token', dataState.data);
    } else if (dataState is DataFailed) {
      emit(AuthFaild(dataState.error!));
    }
  }

  void onConfirmSignUp(
      ConfirmSignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthChecking());
    final dataState = await _confirmUseCase(params: userBox.get('token'));

    if (dataState is DataSuccess) {
      userBox.delete('token');
      emit(const Authenticated());
    } else if (dataState is DataFailed) {
      emit(AuthFaild(dataState.error!));
    }
  }

  void onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(const AuthChecking());
    final dataState = await _loginUseCase(params: event.params);

    if (dataState is DataSuccess) {
      emit(const Authenticated());
    } else if (dataState is DataFailed) {
      emit(AuthFaild(dataState.error!));
    }
  }

  void onLogout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(const AuthChecking());

    await userBox.clear();
    emit(const AuthInitial());
  }

  void onCheckUser(CheckUserEvent event, Emitter<AuthState> emit) async {
    
    final bool flag = await Hive.boxExists('flagBox');

    if (flag) {
      if (userBox.isNotEmpty) {
        emit(const Authenticated());
      } else {
        emit(const Unauthenticated());
      }
    } else {
      await Hive.openBox('flagBox');
      await Hive.box('flagBox').put('flag', true);
      emit(const AuthInitial());
    }
  }

  void onGuestUser(GuestUserEvent event, Emitter<AuthState> emit) async {
    Hive.openBox('guestBox');
    final dataState = await _guestSessionUseCase(params: null);

    if (dataState is DataSuccess) {
      Hive.box('guestBox').put('session_id', dataState.data);
      emit(const AuthGuest());
    } else {
      emit(AuthFaild(dataState.error!));
    }
  }
}
