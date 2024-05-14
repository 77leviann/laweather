import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/screens/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:laweather/widgets/global/custom_bottom_navigation_widget.dart';

part 'on_boarding_content_widget.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingBloc(),
      child: BlocBuilder<OnBoardingBloc, OnBoardingState>(
        builder: (context, state) {
          if (state is OnBoardingInitialState) {
            return const OnBoardingContentWidget();
          } else if (state is OnBoardingCompleteState) {
            return const CustomBottomNavigationWidget();
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
