import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/model/chat_model.dart';

import '../utility/utils.dart';

class ChatScreenProvider with ChangeNotifier {

  bool _isKeyboardOpened = false;
  bool get isKeyboardOpened => _isKeyboardOpened;
  void onCheckKeyboardOpenedOrNot(BuildContext context){
    _isKeyboardOpened = Utils.isKeyboardOpen(context: context);
    notifyListeners();
  }


  TextEditingController chatController = TextEditingController();
  FocusNode chatFocusNode = FocusNode();
  ScrollController chatScrollController = ScrollController();

  bool _isDefaultQuestion1Pressed = false;
  bool _isDefaultQuestion2Pressed = false;
  bool get isDefaultQuestion1Pressed => _isDefaultQuestion1Pressed;
  bool get isDefaultQuestion2Pressed => _isDefaultQuestion2Pressed;

  void onDefaultQuestionPressed(int id){
    if(id == 1){
      _isDefaultQuestion1Pressed = true;
    }
    else{
      _isDefaultQuestion2Pressed = true;
    }
   // notifyListeners();
  }


  @override
  void dispose() {
    chatController.dispose();
    chatFocusNode.dispose();
    super.dispose();
  }

  ChatModel chat = ChatModel();

  void onEdit({required String text}) {
    chatController.text = text;
    notifyListeners();
  }

  ChatModel chatModel = ChatModel();
  final List<String> _defaultQuestionList = [
    "why is my period irregular?",
    "what are early pregnancy symptoms?",
    "what is your name?",
    "i have severe cramps. What should I do?",
    "is back pain normal during pregnancy?",
    "who are you?",
  ];

  List<String> get defaultQuestionList => _defaultQuestionList;

  final List<String> _defaultAnswerList = [
    "Hormonal imbalances, stress, PCOS, thyroid issues, or medications can cause irregular periods. If the irregularity persists or is accompanied by severe symptoms, consult a doctor.",
    "Early pregnancy symptoms include missed periods, nausea, breast tenderness, fatigue, frequent urination, mood swings, and food cravings or aversions. Some may also experience mild cramping, spotting, bloating, and headaches. These signs vary for each person.",
    "My name is Ovella. I am a Period Tracker App, developed by Nahidul Islam Shakin",
    "Cramps are common. Applying a warm compress may help. Would you like medication suggestions?",
    "Yes, it's common. Try light stretching. Want to track this symptom?",
    "I'm AI chat bot, developed by Nahidul Islam Shakin",
  ];

  void sendCommand() {
    Utils.scrollToBottom(scrollController: chatScrollController);
    chat.chat ??= [];

    final String command = chatController.text.toString();

    int index = -1;
    if (command.isNotEmpty && _defaultQuestionList.contains(command.toLowerCase())) {
      index = _defaultQuestionList.indexWhere((item) => item == command.toLowerCase());
      debugPrint("\nquestion list size : ${_defaultQuestionList.length}\nanswer list size : ${_defaultAnswerList.length}\n");
      debugPrint("\nindex : $index\nquestion : ${_defaultQuestionList[index]}\nanswer : ${_defaultAnswerList[index]}");
        chat.chat?.add(Chat(command: command,
        reply: _defaultAnswerList[index]
        ),);
    }
    else if(command.isEmpty){
      chat.chat?.add(Chat(command: "",
          reply: "Hi, Good Morning"));
    }
    else{
      chat.chat?.add(Chat(command: chatController.text,
          reply: "Hi,Good morning, how can I help you?"));
    }

    // if(command.toLowerCase() == DemoChat.command1.toLowerCase()){
    //   chat.chat?.add(Chat(command: command,
    //   reply: DemoChat.reply1));
    // }
    // else if(command.toLowerCase() == DemoChat.defaultCommand1.toLowerCase()){
    //   chat.chat?.add(Chat(command: DemoChat.defaultCommand1,
    //       reply: DemoChat.defaultCommand1Reply));
    // }
    // else if(command.toLowerCase() == DemoChat.defaultCommand2.toLowerCase()){
    //   chat.chat?.add(Chat(command: DemoChat.defaultCommand2,
    //       reply: DemoChat.defaultCommand2Reply));
    // }
    // else if(command.toLowerCase() == DemoChat.command2.toLowerCase()){
    //   chat.chat?.add(Chat(command: DemoChat.command2,
    //       reply: DemoChat.reply2));
    // }
    // else if(command.toLowerCase() == DemoChat.command3.toLowerCase()){
    //   chat.chat?.add(Chat(command: DemoChat.command3,
    //       reply: DemoChat.reply3));
    // }
    // else if(command.toLowerCase() == DemoChat.command4.toLowerCase()){
    //   chat.chat?.add(Chat(command: DemoChat.command4,
    //       reply: DemoChat.reply4));
    // }
    // else if(command.toLowerCase() == DemoChat.command5.toLowerCase()){
    //   chat.chat?.add(Chat(command: DemoChat.command5,
    //       reply: DemoChat.reply5));
    // }
    // else if(command.isEmpty){
    //   chat.chat?.add(Chat(command: "",
    //       reply: "ওই কিরে, ওই কিরে, মধু মধু, রসোমালাই।"));
    // }
    // else{
    //   chat.chat?.add(Chat(command: chatController.text,
    //       reply: "কি বলছেন ভাই জানি না, রোজা রাখছি, ক্লান্ত এখন।"));
    // }
    debugPrint("\nchat : ${chat.chat}\n");
    notifyListeners();
    chatController.clear();
  }

  void onNewChat(){
    chat.chat = null;
    _isDefaultQuestion1Pressed = false;
    _isDefaultQuestion2Pressed = false;
    notifyListeners();
  }
}
