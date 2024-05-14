import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laweather/helpers/shared_pref_helper.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(OnBoardingInitialState()) {
    on<OnBoardingCompleteEvent>((event, emit) async {
      await SharedPreferencesHelper.setFirstTime(false);
      emit(OnBoardingCompleteState());
    });
  }
}
