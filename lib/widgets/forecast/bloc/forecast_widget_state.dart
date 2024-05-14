import 'package:equatable/equatable.dart';

sealed class ForecastWidgetState extends Equatable {
  const ForecastWidgetState();
  
  @override
  List<Object?> get props => [];
}


final class Forecast24HoursState extends ForecastWidgetState {}

final class Forecast7DaysState extends ForecastWidgetState {}