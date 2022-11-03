part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

//////////////////////////////////////////////////////////////
class LogInEvent extends AuthEvent {
  final String email;
  final String password;

  LogInEvent({required this.email, required this.password});
}

//////////////////////////////////////////////////////////
class signUpEvent extends AuthEvent {
  final String email;
  final String password;

  signUpEvent({required this.email, required this.password});
}



     

