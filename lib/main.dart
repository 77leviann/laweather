import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laweather/constants/name_routes_constant.dart';
import 'package:laweather/helpers/shared_pref_helper.dart';
import 'package:laweather/models/services/current_weather_service.dart';
import 'package:laweather/models/services/forecast_by_days_service.dart';
import 'package:laweather/models/services/forecast_hourly_service.dart';
import 'package:laweather/screens/home/bloc/home_bloc.dart';
import 'package:laweather/screens/home/home_screen.dart';
import 'package:laweather/screens/on_boarding/bloc/on_boarding_bloc.dart';
import 'package:laweather/screens/on_boarding/on_boarding_screen.dart';
import 'package:laweather/widgets/current_weather/bloc/current_weather_bloc.dart';
import 'package:laweather/widgets/forecast/bloc/forecast_widget_event.dart';
import 'package:laweather/widgets/forecast/forecast_by_days/bloc/forecast_by_days_bloc.dart';
import 'package:laweather/widgets/forecast/forecast_hourly/bloc/forecast_hourly_bloc.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(
    widgetsBinding: widgetsBinding,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(
        360,
        780,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => OnBoardingBloc(),
          ),
          BlocProvider(
            create: (_) => CurrentWeatherBloc(
              WeatherService(),
            ),
          ),
          BlocProvider(
            create: (_) => ForecastHourlyBloc(
              ForecastHourlyService(),
            ),
          ),
          BlocProvider(
            create: (_) => ForecastByDaysBloc(
              ForecastByDaysService(),
            ),
          ),
          BlocProvider(
            create: (_) => HomeBloc(),
          ),
        ],
        child: MaterialApp(
          theme: FlexThemeData.light(
            scheme: FlexScheme.indigoM3,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 7,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 10,
              blendOnColors: false,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              alignedDropdown: true,
              useInputDecoratorThemeInDialogs: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          darkTheme: FlexThemeData.dark(
            scheme: FlexScheme.indigoM3,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 13,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              useTextTheme: true,
              useM2StyleDividerInM3: true,
              alignedDropdown: true,
              useInputDecoratorThemeInDialogs: true,
            ),
            visualDensity: FlexColorScheme.comfortablePlatformDensity,
            useMaterial3: true,
            swapLegacyOnMaterial3: true,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          initialRoute: NameRoutes.initRoute,
          routes: <String, WidgetBuilder>{
            NameRoutes.initRoute: (context) {
              return FutureBuilder<bool>(
                future: SharedPreferencesHelper.isFirstTime(),
                builder: (context, snapshot) {
                  if (snapshot.data == true) {
                    return const OnBoardingScreen();
                  } else {
                    return const HomeScreen();
                  }
                },
              );
            },
            NameRoutes.onBoardingScreen: (context) => const OnBoardingScreen(),
            NameRoutes.homeScreen: (context) => const HomeScreen(),
          },
        ),
      ),
    );
  }
}
