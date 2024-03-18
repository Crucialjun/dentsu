part of 'home_bloc.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeLeadsLoading extends HomeState {}

final class HomeLeadsLoaded extends HomeState {
  final List<Lead> leads;
  final int totalLeads;
  final int currentPageIndex;

  const HomeLeadsLoaded(this.leads, this.totalLeads, this.currentPageIndex);

  @override
  List<Object> get props => [leads, totalLeads];
}

final class HomeLeadsError extends HomeState {
  final String message;

  const HomeLeadsError(
    this.message,
  );

  @override
  List<Object> get props => [message];
}

final class HomeLeadsCountLoaded extends HomeState {
  final int contactedLeadsCount;
  final int totalLeads;

  const HomeLeadsCountLoaded(this.contactedLeadsCount, this.totalLeads);

  @override
  List<Object> get props => [contactedLeadsCount];
}
