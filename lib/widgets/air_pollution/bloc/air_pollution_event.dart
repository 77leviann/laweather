part of 'air_pollution_bloc.dart';

sealed class AirPollutionEvent extends Equatable {
  const AirPollutionEvent();

  @override
  List<Object?> get props => [];
}

class GetAirPollutionEvent extends AirPollutionEvent {}
