import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:laweather/constants/asset_constant.dart';

class ChatbotProvider extends ChangeNotifier {
  final ChatUser currentUser = ChatUser(
    id: "0",
    firstName: "User",
  );

  final ChatUser geminiUser = ChatUser(
    id: "1",
    firstName: "Gemini AI",
    profileImage: AssetConstant.iconCloudsPng,
  );

  final List<ChatMessage> _messages = [];
  final Gemini gemini = Gemini.instance;
  bool _messageSent = false;

  List<ChatMessage> get messages => _messages;
  bool get messageSent => _messageSent;

  void initChat(String weatherDescription, String cityName, String countryName) {
    if (!_messageSent) {
      _sendMessage(weatherDescription, cityName, countryName);
      _messageSent = true;
    }
  }

  Future<void> _sendMessage(
      String weatherDescription, String cityName, String countryName) async {
    try {
      String question =
          'Hello, give me recommendation activity if weather is $weatherDescription if my location in $cityName, $countryName';
      if (kDebugMode) {
        print(question);
      }
      gemini.streamGenerateContent(question).listen((event) {
        String response = event.content?.parts?.fold(
              "",
              (previousValue, element) => "$previousValue${element.text}",
            ) ??
            "";

        ChatMessage message = ChatMessage(
          user: geminiUser,
          createdAt: DateTime.now(),
          text: response,
        );

        _messages.insert(0, message);
        notifyListeners();
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void handleSendMessage(ChatMessage message) {
    _messages.insert(0, message);
    notifyListeners();

    gemini.streamGenerateContent(message.text).listen((event) {
      String response = event.content?.parts?.fold(
            "",
            (previousValue, element) => "$previousValue${element.text}",
          ) ??
          "";

      ChatMessage geminiMessage = ChatMessage(
        user: geminiUser,
        createdAt: DateTime.now(),
        text: response,
      );

      _messages.insert(0, geminiMessage);
      notifyListeners();
    });
  }
}
