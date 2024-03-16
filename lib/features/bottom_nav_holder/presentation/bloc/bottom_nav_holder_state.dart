part of 'bottom_nav_holder_bloc.dart';

class BottomNavHolderState extends Equatable {
  const BottomNavHolderState({ this.currentIndex = 0});

  final int currentIndex;

  @override
  List<Object> get props => [currentIndex];

  BottomNavHolderState copyWith({int? currentIndex}) {
    return BottomNavHolderState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

final class BottomNavHolderInitial extends BottomNavHolderState {}
