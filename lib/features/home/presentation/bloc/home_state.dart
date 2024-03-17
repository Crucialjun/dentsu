part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();
  
  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLeadsLoading extends HomeState {}

final class HomeLeadsLoaded extends HomeState {
  final List<Lead> leads;

  const HomeLeadsLoaded(this.leads);

  @override
  List<Object> get props => [leads];
}

final class HomeLeadsError extends HomeState {
  final String message;

  const HomeLeadsError(this.message);

  @override
  List<Object> get props => [message];
}


