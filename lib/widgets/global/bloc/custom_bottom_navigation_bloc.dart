import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'custom_bottom_navigation_event.dart';
part 'custom_bottom_navigation_state.dart';

class CustomBottomNavigationBloc
    extends Bloc<CustomBottomNavigationEvent, CustomBottomNavigationState> {
  CustomBottomNavigationBloc() : super(CustomBottomNavigationInitial()) {
    on<CustomBottomNavigationChangeEvent>(_onCustomBottomNavigationChangeEvent);
  }

  void _onCustomBottomNavigationChangeEvent(
      CustomBottomNavigationChangeEvent event,
      Emitter<CustomBottomNavigationState> emit) {
    emit(
      CustomBottomNavigationChangeState(event.pageIndex),
    );
  }
}
