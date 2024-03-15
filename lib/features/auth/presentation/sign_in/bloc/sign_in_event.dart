part of 'sign_in_bloc.dart';

sealed class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class DontHaveAnAccountEvent extends SignInEvent {}

class KeepMeLoggedInToogleEvent extends SignInEvent {
  final bool keepMeLoggedIn;
  const KeepMeLoggedInToogleEvent(this.keepMeLoggedIn);

  @override
  List<Object> get props => [keepMeLoggedIn];
}

class SignInWithEmailAndPasswordEvent extends SignInEvent {
  final String email;
  final String password;
  const SignInWithEmailAndPasswordEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
