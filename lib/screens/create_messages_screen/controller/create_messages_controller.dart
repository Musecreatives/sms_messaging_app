// create_message_controller.dart
import 'package:sms_messaging_app/data/models/message/message.dart';

import '../../../core/app_export.dart';
import '../../../data/models/database_helper.dart';
import '../../drafts_messages_screen/drafts_messages_screen.dart';

class CreateMessageController extends GetxController {
  final TextEditingController messageController = TextEditingController();
  // Draft? draft; // Add a draft parameter
  final dbHelper = DatabaseHelper.instance;

  // CreateMessageController({this.draft}) : messageController = TextEditingController();
  Future<void> saveDraftAndNavigateToDrafts(
      {required UserMessage userMessage}) async {
    // String message = messageController.text;
    // String createdTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

    // final draft = {
    //   'message': message,
    //   'sender': 'Admin', // You can modify this as needed
    //   'time': createdTime,
    // };

    await dbHelper.insertDraft(userMessage);

    // Navigate to DraftsMessagesScreen
    Get.offAll(() => DraftsMessagesScreen());
  }

  // Method to load draft data
  // void loadDraftData() {
  //   if (draft != null) {
  //     messageController = draft!.message;
  //     // You can set other fields here if needed
  //   }
  // }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
