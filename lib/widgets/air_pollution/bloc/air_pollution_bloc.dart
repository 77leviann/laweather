import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:laweather/models/air_pollution_response_model.dart';
import 'package:laweather/models/services/air_pollution_service.dart';

part 'air_pollution_event.dart';
part 'air_pollution_state.dart';

class AirPollutionBloc extends Bloc<AirPollutionEvent, AirPollutionState> {
  final AirPollutionService airPollutionService;

  AirPollutionBloc(this.airPollutionService)
      : super(AirPollutionLoadingState()) {
    on<GetAirPollutionEvent>((event, emit) async {
      await _handleAirPollutionByLocation(emit);
    });
  }

  Future<void> _handleAirPollutionByLocation(
      Emitter<AirPollutionState> emit) async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      emit(
        AirPollutionLoadedState(
          await _getAirPollutionLocation(
            position.latitude.toInt().toString(),
            position.longitude.toInt().toString(),
          ),
        ),
      );
    } catch (e) {
      emit(
        AirPollutionErrorState('$e'),
      );
    }
  }

  Future<AirPollutionResponseModel> _getAirPollutionLocation(
    String lat,
    String lon,
  ) async {
    return await AirPollutionService.getAirPollution(
      lat: lat,
      lon: lon,
    );
  }
}
