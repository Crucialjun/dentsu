import 'dart:async';


import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_holder_event.dart';
part 'bottom_nav_holder_state.dart';

class BottomNavHolderBloc extends Bloc<BottomNavHolderEvent, BottomNavHolderState> {
  BottomNavHolderBloc() : super(BottomNavHolderInitial()) {
    on<BottomNavHolderEvent>((event, emit) {
      
    });
    on<BottomNavHolderIndexChangedEvent>(_onIndexChanged);
    
  }

  FutureOr<void> _onIndexChanged(BottomNavHolderIndexChangedEvent event, Emitter<BottomNavHolderState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
