part of 'sign_in_bloc.dart';

class SignInState extends Equatable {
  final bool keepMeLoggedIn;
  const SignInState({this.keepMeLoggedIn = false});

  @override
  List<Object> get props => [keepMeLoggedIn];

  //copy with
  SignInState copyWith({bool? keepMeLoggedIn}) {
    return SignInState(keepMeLoggedIn: keepMeLoggedIn ?? this.keepMeLoggedIn);
  }
}

final class SignInInitial extends SignInState {}

final class SignInLoading extends SignInState {}
