// lib/controllers/edit_draft_controller.dart
import '../../../core/app_export.dart';
import 'package:sms_messaging_app/data/models/database_helper.dart';
import '../model/edit_drafts_messages_model.dart';

class EditDraftController extends GetxController {
  late TextEditingController messageController;
  late int draftId;

  @override
  void onInit() {
    super.onInit();
    messageController = TextEditingController();
    final draft = Get.arguments as Draft?;
    if (draft != null) {
      draftId = draft.id;
      messageController.text = draft.message;
    }
  }

  Future<void> updateDraft(int id, String updatedMessage) async {
    final updatedMessage = messageController.text;
    if (updatedMessage.isNotEmpty) {
      final dbHelper = DatabaseHelper.instance;
      await dbHelper.updateDraft(draftId, updatedMessage);
      Get.back();
    } else {
      // Show an error message or handle empty message
      
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
