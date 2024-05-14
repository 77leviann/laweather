import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:laweather/models/forecast_by_days_response_model.dart';
import 'package:laweather/models/services/forecast_by_days_service.dart';

part 'forecast_by_days_event.dart';
part 'forecast_by_days_state.dart';

class ForecastByDaysBloc
    extends Bloc<ForecastByDaysEvent, ForecastByDaysState> {
  final ForecastByDaysService forecastByDaysService;

  ForecastByDaysBloc(this.forecastByDaysService)
      : super(ForecastByDaysLoadingState()) {
    on<GetForecastByDaysEvent>((event, emit) async {
      await _onForecastByLocation(
        emit,
      );
    });
  }

  Future<void> _onForecastByLocation(
    Emitter<ForecastByDaysState> emit,
  ) async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(
        ForecastByDaysLoadedState(
          await _getForecastByLocation(
            position.latitude.toInt().toString(),
            position.longitude.toInt().toString(),
          ),
        ),
      );
    } catch (e) {
      emit(
        ForecastByDaysErrorState('$e'),
      );
    }
  }

  Future<ForecastByDaysResponseModel> _getForecastByLocation(
    String lat,
    String lon,
  ) async {
    return await ForecastByDaysService.getForecastByDays(
      lat: lat,
      lon: lon,
    );
  }
}
