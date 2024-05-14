import 'package:flutter/material.dart';
import 'package:laweather/screens/chatbot/provider/chatbot_provider.dart';
import 'package:provider/provider.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:laweather/constants/text_style_constant.dart';
import 'package:laweather/helpers/string_format_helper.dart';
import 'package:laweather/widgets/current_weather/bloc/current_weather_bloc.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChatbotProvider(),
      child: Consumer<ChatbotProvider>(
        builder: (context, chatbotProvider, child) {
          return BlocBuilder<CurrentWeatherBloc, CurrentWeatherState>(
            builder: (context, state) {
              String weatherDescription = state is CurrentWeatherLoadedState
                  ? state.currentWeatherData.weather?.first.description ?? ""
                  : "";
              String cityName = state is CurrentWeatherLoadedState
                  ? state.currentWeatherData.name ?? ""
                  : "";
              String countryName = state is CurrentWeatherLoadedState
                  ? state.currentWeatherData.sys?.country ?? ""
                  : "";

              if (!chatbotProvider.messageSent && state is CurrentWeatherLoadedState) {
                chatbotProvider.initChat(weatherDescription, cityName, countryName);
              }

              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    StringFormatHelper.capitalizeDescription(weatherDescription),
                    style: TextStyleConstant.headlineSmall(context),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  centerTitle: true,
                ),
                body: Padding(
                  padding: EdgeInsets.only(
                    bottom: 16.h,
                  ),
                  child: DashChat(
                    currentUser: chatbotProvider.currentUser,
                    onSend: chatbotProvider.handleSendMessage,
                    messages: chatbotProvider.messages,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
