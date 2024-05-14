import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:laweather/models/forecast_hourly_response_model.dart';
import 'package:laweather/models/services/forecast_hourly_service.dart';

part 'forecast_hourly_event.dart';
part 'forecast_hourly_state.dart';

class ForecastHourlyBloc
    extends Bloc<ForecastHourlyEvent, ForecastHourlyState> {
  final ForecastHourlyService forecastHourlyService;

  ForecastHourlyBloc(this.forecastHourlyService)
      : super(ForecastHourlyLoadingState()) {
    on<GetForecastHourlyEvent>((event, emit) async {
      await _onForecastByLocation(emit);
    });
  }

  Future<void> _onForecastByLocation(
      Emitter<ForecastHourlyState> emit) async {
    try {
      final Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(
        ForecastHourlyLoadedState(
          await _getForecastByLocation(
            position.latitude.toInt().toString(),
            position.longitude.toInt().toString(),
          ),
        ),
      );
    } catch (e) {
      emit(ForecastHourlyErrorState('$e'),);
    }
  }

  Future<ForecastHourlyResponseModel> _getForecastByLocation(
    String lat,
    String lon,
  ) async {
    return await ForecastHourlyService.getForecastHourly(
      lat: lat,
      lon: lon,
    );
  }
}
