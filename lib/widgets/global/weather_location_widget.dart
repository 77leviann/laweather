import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherLocationWidget extends StatelessWidget {
  final dynamic locationName;
  final dynamic locationCode;
  final double? height;
  final double? width;
  final TextStyle? style;
  
  const WeatherLocationWidget({
    super.key,
    required this.locationName,
    required this.locationCode,
    required this.height,
    required this.width,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(
        'Location: $locationName, $locationCode',
      );
    }
    final countryName = CountryCode.fromCountryCode(
          locationCode,
        ).name ??
        '';
    return SizedBox(
      width: width ?? 120.w,
      height: height ?? 24.h,
      child: Text(
        '$locationName, $countryName',
        style: style ?? Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
