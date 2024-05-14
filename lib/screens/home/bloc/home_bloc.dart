import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

part 'home_state.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(RequestLocationState()) {
    on<RequestLocationPermissionEvent>(_onRequestLocationPermissionEvent);
  }

  void _onRequestLocationPermissionEvent(
    RequestLocationPermissionEvent event,
    Emitter<HomeState> emit,
  ) async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      emit(LocationPermissionGrantedState());
    } else if (status.isDenied) {
      emit(LocationPermissionDeniedState());
    }
  }
}
