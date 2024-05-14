import 'package:equatable/equatable.dart';

sealed class ForecastWidgetEvent extends Equatable {
  const ForecastWidgetEvent();

  @override
  List<Object?> get props => [];
}

class ForecastButtonEvent extends ForecastWidgetEvent {}

class Forecast24HoursEvent extends ForecastWidgetEvent {}

class Forecast7DaysEvent extends ForecastWidgetEvent {}
