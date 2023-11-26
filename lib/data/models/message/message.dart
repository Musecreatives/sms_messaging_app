// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserMessage {
  late int? id;
  late String? sender;
  late String? message;
  late DateTime? time;
  UserMessage({
    this.id,
    this.sender,
    this.message,
    this.time,
  });

  UserMessage copyWith({
    int? id,
    String? sender,
    String? message,
    DateTime? time,
  }) {
    return UserMessage(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      message: message ?? this.message,
      time: time ?? this.time,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'sender': sender,
      'message': message,
      'time': time?.toIso8601String(),
    };
  }

  factory UserMessage.fromJson(Map<String, dynamic> map) {
    return UserMessage(
        id: map['id'],
        sender: map['sender'],
        message: map['message'],
        time: DateTime.tryParse(
          map['time'],
        ));
  }
}
