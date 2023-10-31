import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:primary_school/domain/repositories/login_auth/login_auth_repository.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginAuthRepository)
      : super(
          LoginState(
            errorMessage: '',
          ),
        );
  final LoginAuthRepository _loginAuthRepository;

  Future<void> signIn({required String email, required String password}) async {
    try {
      await _loginAuthRepository.signInUser(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginState(
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> createUser(
      {required String email, required String password}) async {
    try {
      await _loginAuthRepository.createUsers(
        email: email,
        password: password,
      );
    } catch (error) {
      emit(
        LoginState(
          errorMessage: error.toString(),
        ),
      );
    }
  }
}
