import 'dart:async';


import 'package:dentsu/core/models/lead_model.dart';
import 'package:dentsu/features/home/domain/params/get_leads_params.dart';
import 'package:dentsu/features/home/domain/usecases/get_leads_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {
      
    });
    on<HomeInitEvent>(_homeInit);
  }

  FutureOr<void> _homeInit(HomeInitEvent event, Emitter<HomeState> emit) async {
    emit(HomeLeadsLoading());
    var res = await GetLeadsUsecase().call(GetLeadsParams(startAt: 0, limit: 10));
    res.fold((l) => emit(HomeLeadsError(l.message)), (r) => emit(HomeLeadsLoaded(r)));
    
  }
}
