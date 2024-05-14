part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetWeatherBySearchLocationEvent extends SearchEvent {
  final String location;

  const GetWeatherBySearchLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}
