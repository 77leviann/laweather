import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/widgets/air_pollution/bloc/air_pollution_bloc.dart';
import 'package:laweather/widgets/global/air_quality_widget.dart';
import 'package:laweather/widgets/global/custom_error_widget.dart';
import 'package:laweather/widgets/global/custom_shimmer_widget.dart';

part 'air_pollution_detail_container_widget.dart';
part 'air_pollution_detail_shimmer_widget.dart';


class AirPollutionDetailContentWidget extends StatelessWidget {
  const AirPollutionDetailContentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AirPollutionBloc, AirPollutionState>(
      builder: (context, state) {
        if (state is AirPollutionLoadingState) {
          BlocProvider.of<AirPollutionBloc>(context)
              .add(GetAirPollutionEvent());
          return const AirPollutionDetailShimmerWidget();
        } else if (state is AirPollutionLoadedState) {
          return AirPollutionDetailContainerWidget(
              airPollutionData: state.airPollutionData);
        } else {
          return CustomErrorWidget(errorState: state as AirPollutionErrorState);
        }
      },
    );
  }
}
