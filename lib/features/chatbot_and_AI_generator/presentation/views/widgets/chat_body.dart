//import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:locus_application/constants/colors.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:locus_application/features/chatbot_and_AI_generator/presentation/views/widgets/sendbtn.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  final _user = ChatUser(id: '1', firstName: 'You');
  final _bot = ChatUser(id: '2', firstName: 'Locus');
  final TextEditingController _userMessage = TextEditingController();

  static const apiKey = "AIzaSyAFuhptBKwY-YbrBg88WWvzbcVESBF0Ai8";
  final model = GenerativeModel(
    model: 'models/gemini-1.5-flash',
    apiKey: apiKey,
  );

  List<ChatMessage> _messages = [];

  @override
  Widget build(BuildContext context) {
    return DashChat(currentUser: _user, onSend: onSend, messages: _messages,
      messageOptions: MessageOptions(
        maxWidth: 250.w,
        showCurrentUserAvatar: false,
        showOtherUsersName: false,
        showOtherUsersAvatar: false,
        borderRadius: 10,
        currentUserContainerColor: LocusColors.primaryColor2.withOpacity(0.8),
        containerColor: LocusColors.primaryColor1.withAlpha(200).withOpacity(0.8),
        currentUserTextColor: LocusColors.white,
        textColor: LocusColors.white,
      ),
      inputOptions: InputOptions(
        inputDecoration: const InputDecoration(
          hintText: '    Ask Locus ..',
          hintStyle: TextStyle(
              color: LocusColors.lightGrey, fontFamily: 'Poppins'),
          border: InputBorder.none,
        ),
        alwaysShowSend: true,
        sendOnEnter: true,
        //sendButtonBuilder: sendButton(),
        inputToolbarStyle: BoxDecoration(
          color: LocusColors.primaryColor2.withOpacity(0.2),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        inputTextStyle: const TextStyle(
            color: LocusColors.lightGrey, fontFamily: 'Poppins'),
        inputToolbarPadding: const EdgeInsets.all(3),
        inputToolbarMargin: const EdgeInsets.symmetric(
            horizontal: 0, vertical: 10),
        cursorStyle: const CursorStyle(color: LocusColors.primaryColor),
      ),
    );
  }

  Future<void> onSend(ChatMessage message) async {
    setState(() {
      _messages.insert(0, message);
    });

    try {
      final response = await model.generateContent([
        Content.text(message.text),
      ]);

      final text = response.text ?? "⚠️ No response from Gemini.";

      final botMessage = ChatMessage(
        user: _bot,
        createdAt: DateTime.now(),
        text: text,
      );

      setState(() {
        _messages.insert(0, botMessage);
      });
    } catch (e) {
      final error = ChatMessage(
        user: _bot,
        createdAt: DateTime.now(),
        text: "⚠️ Error: $e",
      );

      setState(() {
        _messages.insert(0, error);
      });
    }
  }
}


