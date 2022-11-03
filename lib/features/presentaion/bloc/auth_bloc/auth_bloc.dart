import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  String? uid3;

  AuthBloc() : super(AuthInitial()) {
    on<LogInEvent>(logIn);
    on<signUpEvent>(signUP);
  }
////////////////////////////////////////////////////////////////////////////////
  Future<void> logIn(AuthEvent event, Emitter<AuthState> emit) async {
    if (event is LogInEvent) {
      emit(loadingLogInState());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.password,
        );
        emit(successLogInState(succesMessage: "Success"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(ErrorLogInState(errorMessage: "User Not Found"));
        } else if (e.code == 'wrong-password') {
          emit(ErrorLogInState(errorMessage: " Wrong Password"));
        }
      } catch (e) {
        emit(ErrorLogInState(errorMessage: " Samething Is Wrong"));
      }
    }
  }

////////////////////////////////////////////////////////////////////////////////
  Future<void> signUP(AuthEvent event, Emitter<AuthState> emit) async {
    if (event is signUpEvent) {
      emit(loadingSignUpState());
      try {
        UserCredential z = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: event.email, password: event.password);

        uid3 = z.user!.uid;
        emit(successSignUpState(succesMessage: "Sign Up Success"));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          emit(ErrorSignUpState(errorMessage: "User Not Found"));
        } else if (e.code == 'wrong-password') {
          emit(ErrorSignUpState(errorMessage: " Wrong Password"));
        }
      } catch (e) {
        emit(ErrorSignUpState(errorMessage: " Samething Is Wrong"));
      }
    }
  }
}
