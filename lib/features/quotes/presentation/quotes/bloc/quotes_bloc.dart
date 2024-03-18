import 'dart:async';

import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/models/quote.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/home/domain/params/get_leads_params.dart';
import 'package:dentsu/features/quotes/domain/usecases/get_all_quotes_count.dart';
import 'package:dentsu/features/quotes/domain/usecases/get_paginated_quotes_usecase.dart';
import 'package:dentsu/services/navigation_service/i_navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  QuotesBloc() : super(QuotesInitial()) {
    on<QuotesEvent>((event, emit) {});
    on<InitialQuotesEvent>(_quotesInit);
    on<QuotesPaginationPageChangedEvent>(_paginationPageChanged);
    on<OnQuoteSelectedEvent>(_onQuoteSelected);
  }

  final _navigationService = locator<NavigationService>();

  FutureOr<void> _quotesInit(
      InitialQuotesEvent event, Emitter<QuotesState> emit) async {
    emit(QuotesLoading());
    await Future.wait([
      GetPaginatedQuotesUsecase()
          .call(GetPaginatedLeadsParams(startAt: 0, limit: 10)),
      GetAllQuotesCountUsecase().call(NoParams())
    ]).then((value) {
      value[0].fold((l) => emit(QuotesError(message: l.message)), (r) {
        value[1].fold((l) => emit(QuotesError(message: l.message)), (count) {
          emit(QuotesLoaded(
              quotes: r as List<Quote>,
              totalQuotes: count as int,
              currentPage: 1));
        });
      });
    });
  }

  FutureOr<void> _paginationPageChanged(
      QuotesPaginationPageChangedEvent event, Emitter<QuotesState> emit) async {
    emit(QuotesLoading());
    await GetPaginatedQuotesUsecase()
        .call(GetPaginatedLeadsParams(
            startAt: ((event.page + 1) * 10) - 9, limit: 10))
        .then((value) {
      value.fold((l) => emit(QuotesError(message: l.message)), (r) {
        emit(QuotesLoaded(
            quotes: r, totalQuotes: 200, currentPage: event.page + 1));
      });
    });
  }

  FutureOr<void> _onQuoteSelected(OnQuoteSelectedEvent event, Emitter<QuotesState> emit) {
    _navigationService.navigateToNamed('/quote-details', arguments: event.quote);

  }
}
