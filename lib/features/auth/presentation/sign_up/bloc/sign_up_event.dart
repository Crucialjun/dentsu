part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

final class SignUpWithEmailAndPasswordEvent extends SignUpEvent {
  final String email;
  final String password;

  const SignUpWithEmailAndPasswordEvent(
      {required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
