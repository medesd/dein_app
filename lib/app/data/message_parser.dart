class MessageParser{
  String? date;
  int? user;
  List<Message>? data;

  MessageParser({
    this.date,
    this.user,
    this.data,
  });

  factory MessageParser.fromJson(Map<String, dynamic> json) {
    return MessageParser(
      date: json['date'],
      user: json['user'],
      data: json['data'] == null
          ? List<Message>.from([])
          : List<Message>.from(json['data'].map((x) => Message.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        'date': date,
        'user': user,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}


class Message{
  int? user;
  String? message;
  String? date;

  Message({
    this.user,
    this.message,
    this.date,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      user: json['user'],
      message: json['message'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user,
        'message': message,
        'date': date,
      };
}