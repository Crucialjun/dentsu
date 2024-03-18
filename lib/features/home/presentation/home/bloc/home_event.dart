part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeInitEvent extends HomeEvent {}

final class PaginationPageChangedEvent extends HomeEvent {
  final int page;

  const PaginationPageChangedEvent({required this.page});

  @override
  List<Object> get props => [page];
}

final class OnLeadSelectedEvent extends HomeEvent {
  final Lead lead;

  const OnLeadSelectedEvent({required this.lead});

  @override
  List<Object> get props => [lead];
}
