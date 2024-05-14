part of 'custom_bottom_navigation_bloc.dart';

sealed class CustomBottomNavigationState extends Equatable {
  const CustomBottomNavigationState();

  @override
  List<Object?> get props => [];
}

class CustomBottomNavigationInitial extends CustomBottomNavigationState {}

class CustomBottomNavigationChangeState extends CustomBottomNavigationState {
  final int newIndex;

  const CustomBottomNavigationChangeState(this.newIndex);

  @override
  List<Object?> get props => [newIndex];
}
