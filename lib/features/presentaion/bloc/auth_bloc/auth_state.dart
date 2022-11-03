part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}
///////////////////////////////////////////////////////

class loadingLogInState extends AuthState {}

class successLogInState extends AuthState {
  final String succesMessage;

  successLogInState({required this.succesMessage});
}

class ErrorLogInState extends AuthState {
  final String errorMessage;

  ErrorLogInState({required this.errorMessage});
}

/////////////////////////////////////////////////////
class loadingSignUpState extends AuthState {}

class successSignUpState extends AuthState {
  final String succesMessage;

  successSignUpState({required this.succesMessage});
}

class ErrorSignUpState extends AuthState {
  final String errorMessage;

  ErrorSignUpState({required this.errorMessage});
}

////////////////////////////////////////////////////////

