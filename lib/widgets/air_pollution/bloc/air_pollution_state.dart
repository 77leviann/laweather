part of 'air_pollution_bloc.dart';

abstract class AirPollutionState extends Equatable {
  const AirPollutionState();

  @override
  List<Object?> get props => [];
}

class AirPollutionLoadingState extends AirPollutionState {}

class AirPollutionLoadedState extends AirPollutionState {
  final AirPollutionResponseModel airPollutionData;

  const AirPollutionLoadedState(this.airPollutionData);

  @override
  List<Object?> get props => [airPollutionData];
}

class AirPollutionErrorState extends AirPollutionState {
  final String errorMessage;

  const AirPollutionErrorState(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
