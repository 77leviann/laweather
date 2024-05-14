part of 'home_bloc.dart';
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class RequestLocationState extends HomeState {}

class LocationPermissionGrantedState extends HomeState {}

class LocationPermissionDeniedState extends HomeState {}