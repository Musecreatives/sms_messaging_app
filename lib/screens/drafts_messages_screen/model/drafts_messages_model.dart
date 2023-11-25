// draft page model
import '../../../core/app_export.dart';

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['message'] = this.message;
    data['date'] = this.date;
    return data;
  }
}
