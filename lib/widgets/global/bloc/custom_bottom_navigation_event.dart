part of 'custom_bottom_navigation_bloc.dart';

sealed class CustomBottomNavigationEvent extends Equatable {
  const CustomBottomNavigationEvent();

  @override
  List<Object?> get props => [];
}

class CustomBottomNavigationChangeEvent extends CustomBottomNavigationEvent {
  final int pageIndex;

  const CustomBottomNavigationChangeEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}
