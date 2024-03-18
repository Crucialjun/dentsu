import 'dart:async';

import 'package:dentsu/core/locator.dart';
import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/core/usecase.dart';
import 'package:dentsu/features/home/domain/params/get_leads_params.dart';
import 'package:dentsu/features/home/domain/usecases/get_all_leads_count_usecase.dart';
import 'package:dentsu/features/home/domain/usecases/get_contacted_leads_count_usecase.dart';
import 'package:dentsu/features/home/domain/usecases/get_leads_usecase.dart';
import 'package:dentsu/features/home/presentation/lead_details/lead_details_screen.dart';
import 'package:dentsu/services/navigation_service/i_navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitEvent>(_homeInit);
    on<PaginationPageChangedEvent>(_paginationPageChanged);
    on<OnLeadSelectedEvent>(_onLeadSelected);
  }

  final _navigationService = locator<NavigationService>();

  FutureOr<void> _homeInit(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLeadsLoading());

    var totalLeads = 0;

    await Future.wait([
      GetAllLeadsCountUsecase().call(NoParams()),
      GetContactedLeadsCountUsecase().call(NoParams()),
      GetPaginatedLeadsUsecase()
          .call(GetPaginatedLeadsParams(startAt: 0, limit: 10))
    ]).then((value) {
      value[0].fold((l) => emit(HomeLeadsError(l.message)), (r) {
        Logger().i("Total leads: $r");
        totalLeads = r as int;
      });
      value[1].fold((l) => emit(HomeLeadsError(l.message)), (r) {
        Logger().i("Contacted leads: $r");
        emit(HomeLeadsCountLoaded(r as int, totalLeads));
      });
      value[2].fold((l) => emit(HomeLeadsError(l.message)), (r) {
        emit(HomeLeadsLoaded(r as List<Lead>, totalLeads, 1));
      });
    });
  }

  FutureOr<void> _paginationPageChanged(
      PaginationPageChangedEvent event, Emitter<HomeState> emit) async {
    emit(HomeLeadsLoading());
    Logger().i("Page changed to: ${event.page + 1}");
    Logger().i("Start at: ${((event.page + 1) * 10) - 9}");
    await GetPaginatedLeadsUsecase()
        .call(GetPaginatedLeadsParams(
            startAt: ((event.page + 1) * 10) - 9, limit: 10))
        .then((value) {
      value.fold((l) => emit(HomeLeadsError(l.message)), (r) {
        emit(HomeLeadsLoaded(r, 500, event.page + 1));
      });
    });
  }

  FutureOr<void> _onLeadSelected(
      OnLeadSelectedEvent event, Emitter<HomeState> emit) {
    _navigationService.navigateToNamed(LeadDetailsScreen.routeName,
        arguments: event.lead);
  }
}
