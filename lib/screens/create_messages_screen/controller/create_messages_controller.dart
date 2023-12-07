import 'package:sms_messaging_app/data/models/message/message.dart';

import '../../../core/app_export.dart';
import '../../../data/models/database_helper.dart';
import '../../drafts_messages_screen/drafts_messages_screen.dart';

class CreateMessageController extends GetxController {
  final TextEditingController messageController = TextEditingController();

  final dbHelper = DatabaseHelper.instance;

  Future<void> saveDraftAndNavigateToDrafts(
      {required UserMessage userMessage}) async {
    await dbHelper.insertDraft(userMessage);

    Get.offAll(() => DraftsMessagesScreen());
  }

  @override
  void dispose() {
    messageController.dispose();
    messageController.clear();
    super.dispose();
  }
}
