part of 'on_boarding_bloc.dart';

sealed class OnBoardingState extends Equatable {
  const OnBoardingState();
  
  @override
  List<Object> get props => [];
}

class OnBoardingInitialState extends OnBoardingState {}

class OnBoardingCompleteState extends OnBoardingState {}