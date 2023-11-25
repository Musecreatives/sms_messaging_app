// create_message_controller.dart
import 'package:intl/intl.dart';

import '../../../core/app_export.dart';
import '../../../data/models/database_helper.dart';
import '../../drafts_messages_screen/drafts_messages_screen.dart';
import '../../drafts_messages_screen/model/drafts_messages_model.dart';
import '../../edit_drafts_messages/model/edit_drafts_messages_model.dart';

class CreateMessageController extends GetxController {
 TextEditingController messageController;
  Draft? draft;  // Add a draft parameter

  CreateMessageController({this.draft}) : messageController = TextEditingController();
  Future<void> saveDraftAndNavigateToDrafts() async {
    String message = messageController.text;
    String createdTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

    final draft = {
      'message': message,
      'sender': 'Admin', // You can modify this as needed
      'time': createdTime,
    };

    final dbHelper = DatabaseHelper.instance;
    await dbHelper.insertDraft(draft);

    // Navigate to DraftsMessagesScreen
    Get.offAll(() => DraftsMessagesScreen());
  }

  // Method to load draft data
  void loadDraftData() {
    if (draft != null) {
      messageController.text = draft!.message;
      // You can set other fields here if needed
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
