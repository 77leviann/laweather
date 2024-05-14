import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:laweather/constants/text_style_constant.dart';

class CustomErrorWidget extends StatelessWidget {
  final dynamic errorState;

  const CustomErrorWidget({
    super.key,
    required this.errorState,
  });

  @override
  Widget build(BuildContext context) {
    String errorMessage = errorState.errorMessage;
    if (errorMessage == "Null check operator used on a null value" ||
        errorMessage == "Unexpected null value") {
      errorMessage = 'Data not found.';
    }
    if (kDebugMode) {
      print(errorMessage);
    }
    return Center(
      child: Text(errorMessage, style: TextStyleConstant.errorStyle(context)),
    );
  }
}
