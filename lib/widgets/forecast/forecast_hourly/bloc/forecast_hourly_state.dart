part of 'forecast_hourly_bloc.dart';

sealed class ForecastHourlyState extends Equatable {
  const ForecastHourlyState();

  @override
  List<Object> get props => [];
}

class ForecastHourlyLoadingState extends ForecastHourlyState {}

class ForecastHourlyLoadedState extends ForecastHourlyState {
  final ForecastHourlyResponseModel forecastHourlyData;

  const ForecastHourlyLoadedState(this.forecastHourlyData);

  @override
  List<Object> get props => [forecastHourlyData];
}

class ForecastHourlyErrorState extends ForecastHourlyState {
  final String errorMessage;

  const ForecastHourlyErrorState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
