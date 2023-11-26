// draft page model

class DraftsMessagesModel {
  String? name;
  String? number;
  String? message;
  DateTime? date;

  DraftsMessagesModel({this.name, this.number, this.message, this.date});

  DraftsMessagesModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    message = json['message'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['number'] = number;
    data['message'] = message;
    data['date'] = date;
    return data;
  }
}
