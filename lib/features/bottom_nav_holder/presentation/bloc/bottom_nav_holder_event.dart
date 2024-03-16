part of 'bottom_nav_holder_bloc.dart';

sealed class BottomNavHolderEvent extends Equatable {
  const BottomNavHolderEvent();

  @override
  List<Object> get props => [];
}

class BottomNavHolderIndexChangedEvent extends BottomNavHolderEvent {
  final int index;

  const BottomNavHolderIndexChangedEvent(this.index);

  @override
  List<Object> get props => [index];
}
