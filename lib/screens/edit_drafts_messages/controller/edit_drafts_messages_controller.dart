// lib/controllers/edit_draft_controller.dart
import 'package:sms_messaging_app/data/models/message/message.dart';

import '../../../core/app_export.dart';
import 'package:sms_messaging_app/data/models/database_helper.dart';

class EditDraftController extends GetxController {
  final dbHelper = DatabaseHelper.instance;

  Future<void> updateDraft({required UserMessage userMessage}) async {
    await dbHelper.updateDraft(userMessage);
  }
}
