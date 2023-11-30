
import '../../core/handling_flutter_imports/handling_flutter_imports_screen.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class ShowAndHidePasswordState extends AuthState {}

class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserCredential userCredential;

  RegisterSuccessState(this.userCredential);
}

class RegisterFailedState extends AuthState {}

class LoginLoadingState extends AuthState {}

class LoginSuccessState extends AuthState {
  final UserCredential userCredential;

  LoginSuccessState(this.userCredential);
}

class LoginFailedState extends AuthState {}

class CreateUserSuccessState extends AuthState {}

class CreateUserFailedState extends AuthState {}
