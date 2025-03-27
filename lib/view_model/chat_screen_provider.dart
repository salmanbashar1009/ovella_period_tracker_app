import 'package:flutter/material.dart';
import 'package:ovella_period_tracker_app/model/chat_model.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../utility/utils.dart';

class ChatScreenProvider with ChangeNotifier {
  bool _isKeyboardOpened = false;
  bool get isKeyboardOpened => _isKeyboardOpened;
  void onCheckKeyboardOpenedOrNot(BuildContext context) {
    _isKeyboardOpened = Utils.isKeyboardOpen(context: context);
    notifyListeners();
  }

  TextEditingController chatController = TextEditingController();
  FocusNode chatFocusNode = FocusNode();
  ScrollController chatScrollController = ScrollController();
  ScrollController chatScrollController2 = ScrollController();

  bool _isDefaultQuestion1Pressed = false;
  bool _isDefaultQuestion2Pressed = false;
  bool get isDefaultQuestion1Pressed => _isDefaultQuestion1Pressed;
  bool get isDefaultQuestion2Pressed => _isDefaultQuestion2Pressed;

  void onDefaultQuestionPressed(int id) {
    if (id == 1) {
      _isDefaultQuestion1Pressed = true;
    } else {
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
    Utils.scrollToBottom(scrollController: _isFullScreen?chatScrollController2:chatScrollController);
    chat.chat ??= [];

    final String command = chatController.text.toString();

    int index = -1;
    if (command.isNotEmpty &&
        _defaultQuestionList.contains(command.toLowerCase())) {
      index = _defaultQuestionList.indexWhere(
        (item) => item == command.toLowerCase(),
      );
      debugPrint(
        "\nquestion list size : ${_defaultQuestionList.length}\nanswer list size : ${_defaultAnswerList.length}\n",
      );
      debugPrint(
        "\nindex : $index\nquestion : ${_defaultQuestionList[index]}\nanswer : ${_defaultAnswerList[index]}",
      );
      chat.chat?.add(Chat(command: command, reply: _defaultAnswerList[index]));
    } else if (command.isEmpty) {
      chat.chat?.add(
        Chat(
          command: chatController.text,
          reply: "Hello, Our backend has not been developed yet. We will work on it later. Please try again later.",
        ),
      );
    }
    else {
      chat.chat?.add(
        Chat(
          command: chatController.text,
          reply: "Hello, Our backend has not been developed yet. We will work on it later. Please try again later.",
        ),
      );
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

  void onNewChat() {
    chat.chat = null;
    _isDefaultQuestion1Pressed = false;
    _isDefaultQuestion2Pressed = false;
    notifyListeners();
  }

  //new chat animation
  bool _isOpenNewChatField = false;
  bool get isOpenNewChatField => _isOpenNewChatField;
  TextEditingController newChatNameController = TextEditingController();

  void toggleNewChatField(bool value) {
    _isOpenNewChatField = value;
    if (value == true) {
      timeCount();
    }
    debugPrint('New Chat Field: $_isOpenNewChatField');
    notifyListeners();
  }

  Future<void> timeCount() async {
    await Future.delayed(Duration(seconds: 10));
    if (newChatNameController.text.toString().isEmpty) {
      toggleNewChatField(false);
    }
  }

  //dropdown menu
  bool _isOpenMenu = false;
  bool get isOpenMenu => _isOpenMenu;
  void toggleOpenMenu() {
    _isOpenMenu = !_isOpenMenu;
    notifyListeners();
  }

  // full screen mode
  bool _isFullScreen = false;
  bool get isFullScreen => _isFullScreen;
  void toggleFullScreenMode(){
    _isFullScreen =!_isFullScreen;
  }


  // voice to text
  final SpeechToText _speech = SpeechToText();
  bool _isListening = false;
  String _text = '';

  bool get isListening => _isListening;
  String get text => _text;

  Future<void> initializeSpeech() async {
    bool available = await _speech.initialize();
    if (!available) {
      _text = "Speech recognition not available";
      notifyListeners();
    }
  }
  void startListening() async {
    bool available = await _speech.initialize();
    if (available) {
      _isListening = true;
      notifyListeners();

      _speech.listen(
        onResult: (result) {
          _text = result.recognizedWords;
          chatController.text = result.recognizedWords;
          debugPrint('My speech: $_text');
          debugPrint('Listening: $_isListening');
          notifyListeners();
        },
      );
    }
  }
  /// Stop listening
  void stopListening() {
    _isListening = false;
    _speech.stop();
    notifyListeners();
  }
}
