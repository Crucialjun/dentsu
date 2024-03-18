part of 'quotes_bloc.dart';

sealed class QuotesState extends Equatable {
  const QuotesState();

  @override
  List<Object> get props => [];
}

final class QuotesInitial extends QuotesState {}

final class QuotesLoading extends QuotesState {}

final class QuotesLoaded extends QuotesState {
  final List<Quote> quotes;
  final int totalQuotes;
  final int currentPage;
  

  const QuotesLoaded({
    required this.quotes,
    required this.totalQuotes,
    required this.currentPage,
   
  });

  QuotesLoaded copyWith({
    List<Quote>? quotes,
    int? totalQuotes,
    int? currentPage,
   
  }) {
    return QuotesLoaded(
      quotes: quotes ?? this.quotes,
      totalQuotes: totalQuotes ?? this.totalQuotes,
      currentPage: currentPage ?? this.currentPage,

     
    );
  }

  @override
  List<Object> get props => [quotes,totalQuotes];
}

final class QuotesError extends QuotesState {
  final String message;

  const QuotesError({
    required this.message,
  });

  QuotesError copyWith({
    String? message,
  }) {
    return QuotesError(
      message: message ?? this.message,
    );
  }

  @override
  List<Object> get props => [message];
}

