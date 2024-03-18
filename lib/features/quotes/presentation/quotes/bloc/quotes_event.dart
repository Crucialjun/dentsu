part of 'quotes_bloc.dart';

sealed class QuotesEvent extends Equatable {
  const QuotesEvent();

  @override
  List<Object> get props => [];
}

class InitialQuotesEvent extends QuotesEvent {}

class QuotesPaginationPageChangedEvent extends QuotesEvent {
  final int page;

  const QuotesPaginationPageChangedEvent({required this.page});

  @override
  List<Object> get props => [page];
}

class OnQuoteSelectedEvent extends QuotesEvent {
  final Quote quote;

  const OnQuoteSelectedEvent({required this.quote});

  @override
  List<Object> get props => [quote];
}
