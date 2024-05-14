import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laweather/widgets/forecast/bloc/forecast_widget_event.dart';
import 'package:laweather/widgets/forecast/bloc/forecast_widget_state.dart';

class ForecastWidgetBloc extends Bloc<ForecastWidgetEvent, ForecastWidgetState> {
  ForecastWidgetBloc()
      : super(
          Forecast24HoursState(),
        ) {
    on<ForecastWidgetEvent>((event, emit) {
      if (event is ForecastButtonEvent) {
        if (state is Forecast24HoursState) {
          emit(Forecast7DaysState(),);
        } else if (state is Forecast7DaysState) {
          emit(Forecast24HoursState(),);
        }
      } else if (event is Forecast24HoursEvent) {
        emit(Forecast24HoursState());
      } else if (event is Forecast7DaysEvent) {
        emit(Forecast7DaysState());
      }
    });
  }
}
