part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitialState extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchSuccessState extends SearchState {
  final CurrentWeatherResponseModel currentWeatherData;

  const SearchSuccessState(this.currentWeatherData);

  @override
  List<Object> get props => [currentWeatherData];
}

class SearchFailedState extends SearchState {
  final String errorMessage;

  const SearchFailedState(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
