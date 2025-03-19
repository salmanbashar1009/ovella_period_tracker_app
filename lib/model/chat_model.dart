class ChatModel {
  List<Chat>? chat;

  ChatModel({this.chat});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ChatModel(chat: $chat)';
  }
}

class Chat {
  String? command;
  String? reply;

  Chat({this.command, this.reply});

  Chat.fromJson(Map<String, dynamic> json) {
    command = json['command'];
    reply = json['reply'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['command'] = command;
    data['reply'] = reply;
    return data;
  }

  @override
  String toString() {
    return 'Chat(command: $command, reply: $reply)';
  }
}
